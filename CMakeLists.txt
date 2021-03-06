cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    moneypal
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    moneypal_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    moneypal_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(moneypal_lib PUBLIC cxx_std_17)

# ---- Declare executable ----

add_executable(moneypal_exe source/main.cpp)
add_executable(moneypal::exe ALIAS moneypal_exe)

set_target_properties(
    moneypal_exe PROPERTIES
    OUTPUT_NAME moneypal
    EXPORT_NAME exe
)

target_compile_features(moneypal_exe PRIVATE cxx_std_17)

target_link_libraries(moneypal_exe PRIVATE moneypal_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT moneypal_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of moneypal"
  )
endif()

include(cmake/dev-mode.cmake)
