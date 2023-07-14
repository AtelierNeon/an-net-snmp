cmake_minimum_required (VERSION 3.1)

## Project basic information
project (netsnmp
    VERSION 5.8.0
    DESCRIPTION "Net-SNMP")

## Project options
option (NETSNMP_WITH_IPV6 "Build Net-SNMP with IPv6 transports." OFF)
option (NETSNMP_WITH_SDK "Build Net-SNMP with Microsoft Platform SDK." ON)
option (NETSNMP_WITH_SSL "Build Net-SNMP with OpenSSL." OFF)
option (NETSNMP_WITH_SIBLING_SSL "Build Net-SNMP with sibling OpenSSL." OFF)
option (NETSNMP_WITH_SHARED_LIBRARIES "Build shared version of the libnetsnmp library." OFF)
option (NETSNMP_WITH_WINEXTDLL "Build Net-SNMP with winExtDll." OFF)

## Separate version number into 4 parts
string (REGEX MATCHALL "[0-9]+" _my_ver_LIST "${PROJECT_VERSION}")
list (LENGTH _my_ver_LIST _my_list_len)
list (GET _my_ver_LIST 0 NETSNMP_VER_MAJOR)
list (GET _my_ver_LIST 1 NETSNMP_VER_MINOR)
list (GET _my_ver_LIST 2 NETSNMP_VER_PATCH)
if (_my_list_len EQUAL 4)
    list (GET _my_ver_LIST 3 NETSNMP_VER_PATCHLEVEL)
endif ()

## Project compiler definitions and flags
if (WIN32)
    add_definitions (
        -D_CONSOLE
        -D_CRT_NONSTDC_NO_WARNINGS
        -D_CRT_SECURE_NO_WARNINGS
        -D_MBCS
        -D_WINSOCK_DEPRECATED_NO_WARNINGS)
endif ()
if (MSVC)
    set (CMAKE_C_FLAGS "/wd4244 /wd4267 ${CMAKE_C_FLAGS}")
    set (CMAKE_CXX_FLAGS "/wd4244 /wd4267 ${CMAKE_CXX_FLAGS}")
endif ()
if (NETSNMP_WITH_IPV6)
    add_definitions (
        -DNETSNMP_ENABLE_IPV6)
    set (NETSNMP_WITH_SDK ON)
endif ()
if (NETSNMP_WITH_SSL)
    if (NETSNMP_WITH_SIBLING_SSL)
        message (STATUS "Use sibling OpenSSL for ${PROJECT_NAME}.")
        set (OPENSSL_FOUND ON)
        set (OPENSSL_INCLUDE_DIR "${netsnmp_SOURCE_DIR}/../openssl/include/")
        set (OPENSSL_CRYPTO_LIBRARIES crypto)
        set (OPENSSL_SSL_LIBRARIES ssl)
        set (OPENSSL_LIBRARIES
            ${OPENSSL_CRYPTO_LIBRARIES}
            ${OPENSSL_SSL_LIBRARIES})
        add_definitions (
            -DNETSNMP_USE_SIBLING_OPENSSL)
    else (NETSNMP_WITH_SIBLING_SSL)
        find_package (OpenSSL REQUIRED)
        message (STATUS ${OPENSSL_FOUND})
    endif (NETSNMP_WITH_SIBLING_SSL)
    add_definitions (
        -DNETSNMP_USE_OPENSSL)
else ()
    set (OPENSSL_INCLUDE_DIR "")
endif ()
if (NETSNMP_WITH_SHARED_LIBRARIES)
    add_definitions (
        -DNETSNMP_USE_DLL)
endif ()
if (NETSNMP_WITH_WINEXTDLL)
    add_definitions (
        -DUSING_WINEXTDLL_MODULE)
endif ()

## Process sub-components
add_subdirectory (agent)
add_subdirectory (apps)
add_subdirectory (snmplib)
