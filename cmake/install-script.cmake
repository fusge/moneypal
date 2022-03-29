file(
    RELATIVE_PATH relative_path
    "/${moneypal_INSTALL_CMAKEDIR}"
    "/${CMAKE_INSTALL_BINDIR}/${moneypal_NAME}"
)

get_filename_component(prefix "${CMAKE_INSTALL_PREFIX}" ABSOLUTE)
set(config_dir "${prefix}/${moneypal_INSTALL_CMAKEDIR}")
set(config_file "${config_dir}/moneypalConfig.cmake")

message(STATUS "Installing: ${config_file}")
file(WRITE "${config_file}" "\
get_filename_component(
    _moneypal_executable
    \"\${CMAKE_CURRENT_LIST_DIR}/${relative_path}\"
    ABSOLUTE
)
set(
    MONEYPAL_EXECUTABLE \"\${_moneypal_executable}\"
    CACHE FILEPATH \"Path to the moneypal executable\"
)
")
