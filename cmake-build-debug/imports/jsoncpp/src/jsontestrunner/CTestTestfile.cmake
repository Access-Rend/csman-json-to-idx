# CMake generated Testfile for 
# Source directory: /mnt/d/mywork/csman_json_to_idx/imports/jsoncpp/src/jsontestrunner
# Build directory: /mnt/d/mywork/csman_json_to_idx/cmake-build-debug/imports/jsoncpp/src/jsontestrunner
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test("jsoncpp_readerwriter" "/usr/bin/python3.6" "-B" "/mnt/d/mywork/csman_json_to_idx/imports/jsoncpp/src/jsontestrunner/../../test/runjsontests.py" "/mnt/d/mywork/csman_json_to_idx/cmake-build-debug/bin/jsontestrunner_exe" "/mnt/d/mywork/csman_json_to_idx/imports/jsoncpp/src/jsontestrunner/../../test/data")
set_tests_properties("jsoncpp_readerwriter" PROPERTIES  WORKING_DIRECTORY "/mnt/d/mywork/csman_json_to_idx/imports/jsoncpp/src/jsontestrunner/../../test/data" _BACKTRACE_TRIPLES "/mnt/d/mywork/csman_json_to_idx/imports/jsoncpp/src/jsontestrunner/CMakeLists.txt;43;add_test;/mnt/d/mywork/csman_json_to_idx/imports/jsoncpp/src/jsontestrunner/CMakeLists.txt;0;")
add_test("jsoncpp_readerwriter_json_checker" "/usr/bin/python3.6" "-B" "/mnt/d/mywork/csman_json_to_idx/imports/jsoncpp/src/jsontestrunner/../../test/runjsontests.py" "--with-json-checker" "/mnt/d/mywork/csman_json_to_idx/cmake-build-debug/bin/jsontestrunner_exe" "/mnt/d/mywork/csman_json_to_idx/imports/jsoncpp/src/jsontestrunner/../../test/data")
set_tests_properties("jsoncpp_readerwriter_json_checker" PROPERTIES  WORKING_DIRECTORY "/mnt/d/mywork/csman_json_to_idx/imports/jsoncpp/src/jsontestrunner/../../test/data" _BACKTRACE_TRIPLES "/mnt/d/mywork/csman_json_to_idx/imports/jsoncpp/src/jsontestrunner/CMakeLists.txt;47;add_test;/mnt/d/mywork/csman_json_to_idx/imports/jsoncpp/src/jsontestrunner/CMakeLists.txt;0;")
