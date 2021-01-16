#include <iostream>
#include "json/json.h"
#include "json_to_idx.hpp"
int main() {
    json s("/mnt/c/Users/Rend/Desktop/generic.json", "/mnt/c/Users/Rend/Desktop/Linux_GCC_AMD64.json");
    s.output_json("/mnt/c/Users/Rend/Desktop/testtest.json");
    s.output_idx("/mnt/c/Users/Rend/Desktop/sources.idx");
    return 0;
}