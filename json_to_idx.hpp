//
// Created by Rend on 2020/9/25.
// this is only use for sources.json(from csman) trans to sources.idx
//
#pragma once

#include<set>
#include<vector>
#include<cstdio>
#include<cstring>
#include<fstream>
#include<iostream>
#include<algorithm>
#include<json/json.h>

class json {
private:
    class pac_info {
    public:
        std::string name, author, description;

        class v_u_i {
        public:
            std::string ver, url, std, abi;
            int id;

            v_u_i(const std::string &v, const std::string &u) : ver(v), url(u) {};
        };

        std::vector<v_u_i> ver_url_id;

        pac_info(
                const std::string &n,
                const std::string &a,
                const std::string &d
        ) :
                name(n), author(a), description(d) {};
    };

    int find_pac_id(const std::vector<pac_info> &a,const std::string &name,const std::string &ver){
        for(const auto &x : a)
            if(x.name==name){
                if(ver=="Unstable")   return x.ver_url_id[0].id;
                if(ver=="Stable")   return x.ver_url_id[1].id;
                for(const auto &y : x.ver_url_id)
                    if(y.ver==ver)
                        return y.id;
            }
        return 0;
    }

    Json::Value root;

    Json::Value *read_json(const std::string &path);

    void json_merge(Json::Value &a, Json::Value &b);

public:
    json(const std::string &path_gen, const std::string &path_pla);

    void output_json(const std::string &path);

    void output_idx(const std::string &path);
};

void json::output_json(const std::string &path) {
    std::ofstream ofs(path);
    ofs << this->root;
    ofs.close();
    return;
}

Json::Value *json::read_json(const std::string &path) {
    Json::CharReaderBuilder builder;
    JSONCPP_STRING jsonErrs;
    Json::Value *res = new Json::Value;
    std::ifstream ifs(path);
    if (!ifs.is_open()) {
        ifs.close();
        throw std::runtime_error("opening \"" + path + "\" failed!");
    } else {
        if (!Json::parseFromStream(builder, ifs, res, &jsonErrs)) {
            ifs.close();
            throw std::runtime_error("parsing \"" + path + "\" as json_file failed!");
        }
    }
    return res;
}

void json::json_merge(Json::Value &a, Json::Value &b) {
    if (!a.isObject() || !b.isObject()) return;
    for (const auto &key : b.getMemberNames()) {
        if (a[key].empty())
            a[key] = b[key];
        else
            json_merge(a[key], b[key]);
    }
}

json::json(const std::string &path_gen, const std::string &path_pla) {
    Json::Value *root_gen, *root_plt;
    root_gen = read_json(path_gen);
    root_plt = read_json(path_pla);
    json_merge(*root_gen, *root_plt);
    this->root = *root_gen;
}

void json::output_idx(const std::string &path) {
    if (this->root.empty())
        throw std::runtime_error("this json_file is empty! can not output as \"idx\"");
    std::vector<pac_info> list_pac;
    int cnt = 0; // cnt & cnt_ver

    for (const auto &tag: root.getMemberNames()) {
// for each pac with all version
        for (const auto &pac:root[tag].getMemberNames()) {

            list_pac.push_back(
                    pac_info(pac, root[tag][pac]["Author"].asString(), root[tag][pac]["Description"].asString()));
            pac_info &list_tail = *(list_pac.end() - 1);

            list_tail.ver_url_id.reserve(root[tag][pac]["Version"].size() + 1);

            if (root[tag][pac]["Unstable"].isNull())
                list_tail.ver_url_id.push_back(pac_info::v_u_i("0", ""));

            for (const auto &ver:root[tag][pac]["Version"].getMemberNames()) {
                list_tail.ver_url_id.push_back(
                        pac_info::v_u_i(ver, root[tag][pac]["Version"][ver]["ContentUrl"].asString())
                );
                if (pac == "cs.runtime")
                    (list_tail.ver_url_id.end() - 1)->abi = root[tag][pac]["Version"][ver]["ABI"].asString(),
                            (list_tail.ver_url_id.end() - 1)->std = root[tag][pac]["Version"][ver]["STD"].asString();
            }
            sort(list_tail.ver_url_id.begin() + 1, list_tail.ver_url_id.end(),
                 [](const pac_info::v_u_i &a, const pac_info::v_u_i &b) {
                     return a.ver > b.ver;
                 }
            );

            for (int i = 0; i < list_tail.ver_url_id.size(); i++)
                list_tail.ver_url_id[i].id = ++cnt;
        }
    }
    // out put

    std::ofstream ofs(path);
    ofs << "2021.02.30.10.35" << std::endl;
    ofs << "PAC" << " " << list_pac.size() << " " << cnt << std::endl;
    for (const auto &x:list_pac) {
        ofs << x.name << " " << x.ver_url_id.size() << std::endl;
        ofs << x.author << std::endl;
        ofs << x.description << std::endl;
        for (const auto &y:x.ver_url_id) {
            ofs << y.ver << " ";
            if (y.ver != "0") {
                if (x.name == "cs.runtime")
                    ofs << "ABI" << y.abi << " " << "STD" << y.std << " ";
                ofs << y.url << " ";
            }
        }
        ofs << std::endl;
    }


    for (const auto &tag:root.getMemberNames()){
        if(tag=="Generic")
            std::cerr<<"shit"<<std::endl;
        ofs<<tag<<" "<<root[tag].size()<<std::endl;
        for (const auto &pac:root[tag].getMemberNames())
            for (const auto &ver:root[tag][pac]["Version"].getMemberNames()){
                int u_id = find_pac_id(list_pac,pac,ver);
                std::stack<int> out_degree;
                for (const auto &dep_name : root[tag][pac]["Version"][ver]["Dependencies"].getMemberNames()){
                    int v_id = find_pac_id(list_pac,dep_name,root[tag][pac]["Version"][ver]["Dependencies"][dep_name].asString());
                    out_degree.push(v_id);
                }
                ofs<<u_id<<" ";
                while(!out_degree.empty()){
                    ofs<<out_degree.top()<<" ";
                    out_degree.pop();
                }
                ofs<<std::endl;
            }
    }
    ofs.close();
    return;
}