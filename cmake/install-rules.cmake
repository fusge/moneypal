include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# find_package(<package>) call for consumers to find this project
set(package moneypal)

install(
    TARGETS moneypal_exe
    RUNTIME COMPONENT moneypal_Runtime
)

write_basic_package_version_file(
    "${package}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)

# Allow package maintainers to freely override the path for the configs
set(
    moneypal_INSTALL_CMAKEDIR "${CMAKE_INSTALL_DATADIR}/${package}"
    CACHE PATH "CMake package config location relative to the install prefix"
)
mark_as_advanced(moneypal_INSTALL_CMAKEDIR)

install(
    FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    DESTINATION "${moneypal_INSTALL_CMAKEDIR}"
    COMPONENT moneypal_Development
)

# Export variables for the install script to use
install(CODE "
set(moneypal_NAME [[$<TARGET_FILE_NAME:moneypal_exe>]])
set(moneypal_INSTALL_CMAKEDIR [[${moneypal_INSTALL_CMAKEDIR}]])
set(CMAKE_INSTALL_BINDIR [[${CMAKE_INSTALL_BINDIR}]])
" COMPONENT moneypal_Development)

install(
    SCRIPT cmake/install-script.cmake
    COMPONENT moneypal_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
