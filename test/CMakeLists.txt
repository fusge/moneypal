# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(moneypalTests LANGUAGES CXX)

# ---- Tests ----

add_executable(moneypal_test source/moneypal_test.cpp)
target_link_libraries(moneypal_test PRIVATE moneypal_lib)
target_compile_features(moneypal_test PRIVATE cxx_std_17)

add_test(NAME moneypal_test COMMAND moneypal_test)

# ---- End-of-file commands ----

add_folders(Test)
