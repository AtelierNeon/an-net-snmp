cmake_minimum_required (VERSION 3.1)

## Project basic information
project (netsnmp
    VERSION 5.8.0
    DESCRIPTION "Net-SNMP")

## Project options
option (NETSNMP_WITH_DISABLED_MIB_LOADING "Build Net-SNMP with disabled MIB loading." OFF)
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

list (APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

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
if (UNIX)
    set (CMAKE_C_FLAGS "-Wno-unused-parameter -Wno-unused-variable -Wno-format-truncation -Wno-implicit-function-declaration ${CMAKE_C_FLAGS}")
    set (CMAKE_CXX_FLAGS "-Wno-unused-parameter -Wno-unused-variable -Wno-format-truncation -Wno-implicit-function-declaration ${CMAKE_CXX_FLAGS}")
endif ()
if (NETSNMP_WITH_DISABLED_MIB_LOADING)
    add_definitions(
        -DNETSNMP_DISABLE_MIB_LOADING)
endif ()
if (NETSNMP_WITH_IPV6)
    add_definitions (
        -DNETSNMP_ENABLE_IPV6)
    set (NETSNMP_WITH_SDK ON)
endif ()
if (NETSNMP_WITH_SSL OR NETSNMP_WITH_SIBLING_SSL)
    if (NETSNMP_WITH_SIBLING_SSL)
        message (STATUS "Use sibling OpenSSL for ${PROJECT_NAME}.")
        set (OPENSSL_FOUND ON)
        set (OPENSSL_INCLUDE_DIRS
            "${PROJECT_SOURCE_DIR}/../openssl/include/"
            "${PROJECT_BINARY_DIR}/../openssl/include/")
        set (OPENSSL_CRYPTO_LIBRARY crypto)
        set (OPENSSL_SSL_LIBRARY ssl)
        set (OPENSSL_LIBRARIES
            ${OPENSSL_CRYPTO_LIBRARY}
            ${OPENSSL_SSL_LIBRARY})
        add_definitions (
            -DNETSNMP_USE_SIBLING_OPENSSL)
    else ()
        find_package (OpenSSL REQUIRED)
        message (STATUS ${OPENSSL_FOUND})
    endif ()
    add_definitions (
        -DNETSNMP_USE_OPENSSL)
endif ()
if (NETSNMP_WITH_SHARED_LIBRARIES)
    add_definitions (
        -DNETSNMP_USE_DLL)
endif ()
if (NETSNMP_WITH_WINEXTDLL)
    add_definitions (
        -DUSING_WINEXTDLL_MODULE)
endif ()

if (NOT WIN32)
    set (CMAKE_POSITION_INDEPENDENT_CODE ON)
    add_definitions (-D_GNU_SOURCE)
    list (APPEND CMAKE_REQUIRED_DEFINITIONS -D_GNU_SOURCE)
    if (Linux)
        add_definitions (-Dlinux)
    endif ()
endif ()

set (ETC_MNTTAB "\"unknown\"")
set (KERNEL_LOC "\"unknown\"")
set (NETSNMP_ENABLE_IPV6 1)
set (NETSNMP_NO_DUMMY_VALUES 1)
set (NETSNMP_SECMOD_USM 1)
set (NETSNMP_SYS_CONTACT "\"unknown\"")
set (NETSNMP_SYS_LOC "\"unknown\"")
set (NETSNMP_TRANSPORT_ALIAS_DOMAIN 1)
set (NETSNMP_TRANSPORT_CALLBACK_DOMAIN 1)
set (NETSNMP_TRANSPORT_IPV4BASE_DOMAIN 1)
#set (NETSNMP_TRANSPORT_SSH_DOMAIN 1)
set (NETSNMP_TRANSPORT_TCP_DOMAIN 1)
set (NETSNMP_TRANSPORT_TCPIPV6_DOMAIN 1)
set (NETSNMP_TRANSPORT_UDP_DOMAIN 1)
set (NETSNMP_TRANSPORT_UDPIPV6_DOMAIN 1)
set (NETSNMP_TRANSPORT_UDPSHARED_DOMAIN 1)
set (NETSNMP_WITH_OPAQUE_SPECIAL_TYPES 1)
set (PACKAGE_VERSION "\"${PROJECT_VERSION}.${MY_REVISION}\"")
set (SECOND_APPVERIFY_COOKIE_CB_ARG_QUALIFIER "const")
set (STDC_HEADERS 1)

if (WIN32)
    set (NETSNMP_DEFAULT_MIBDIRS "\"C:/ProgramData/net-snmp/share/mibs\"")
    set (NETSNMP_ENABLE_SCAPI_AUTHPRIV 1)
    set (NETSNMP_PERSISTENT_DIRECTORY "\"C:/ProgramData/net-snmp/persist/snmp\"")
    set (NETSNMP_TEMP_FILE_PATTERN "\"C:/ProgramData/net-snmp/temp/snmpdXXXXXX\"")
    set (RTENTRY "rtentry;")
    set (SNMPLIBPATH "\"C:/ProgramData/net-snmp/lib\"")
    set (SNMPSHAREPATH "\"C:/ProgramData/net-snmp/share\"")
    set (SNMPCONFPATH "\"C:/ProgramData/net-snmp/etc\"")
    set (SNMPDLMODPATH "\"C:/ProgramData/net-snmp/lib/dlmod\"")
    if (NETSNMP_WITH_SDK)
        set (HAVE_WIN32_PLATFORM_SDK 1)
    endif ()
else ()
    set (NETSNMP_DEFAULT_MIBDIRS "\"/usr/local/share/snmp/mibs\"")
    set (NETSNMP_PERSISTENT_DIRECTORY "\"var/snmp\"")
    set (NETSNMP_TEMP_FILE_PATTERN "\"/tmp/snmpdXXXXXX\"")
    set (NETSNMP_TRANSPORT_IPX_DOMAIN 1)
    set (NETSNMP_TRANSPORT_STD_DOMAIN 1)
    set (NETSNMP_TRANSPORT_UNIX_DOMAIN 1)
    set (RTENTRY "struct rtentry")
    set (SNMPLIBPATH "\"/usr/local/lib/snmp\"")
    set (SNMPSHAREPATH "\"/usr/local/share/snmp\"")
    set (SNMPCONFPATH "\"/usr/local/etc/snmp\"")
    set (SNMPDLMODPATH "\"/usr/local/lib/snmp/dlmod\"")
endif ()

if (NETSNMP_WITH_SSL)
    set (HAVE_AES_CFB128_ENCRYPT 1)
    set (HAVE_ASN1_STRING_GET0_DATA 1)
    set (HAVE_DH_GET0_KEY 1)
    set (HAVE_DH_GET0_PQG 1)
    set (HAVE_DH_SET0_PQG 1)
    set (HAVE_DTLSV1_METHOD 1)
    set (HAVE_DTLS_METHOD 1)
    set (HAVE_EVP_MD_CTX_CREATE 1)
    set (HAVE_EVP_MD_CTX_DESTROY 1)
    set (HAVE_EVP_MD_CTX_FREE 1)
    set (HAVE_EVP_MD_CTX_NEW 1)
    set (HAVE_EVP_SHA224 1)
    set (HAVE_EVP_SHA384 1)
    set (HAVE_LIBCRYPTO 1)
    set (HAVE_LIBSSL 1)
    set (HAVE_LIBSSL_DTLS 1)
    set (HAVE_OPENSSL_AES_H 1)
    set (HAVE_OPENSSL_DES_H 1)
    set (HAVE_OPENSSL_DH_H 1)
    set (HAVE_OPENSSL_EVP_H 1)
    set (HAVE_OPENSSL_HMAC_H 1)
    set (HAVE_TLSV1_METHOD 1)
    set (HAVE_TLS_METHOD 1)
    set (HAVE_X509_GET_SIGNATURE_NID 1)
    set (HAVE_X509_NAME_ENTRY_GET_DATA 1)
    set (HAVE_X509_NAME_ENTRY_GET_OBJECT 1)
    set (NETSNMP_CAN_DO_CRYPTO 1)
    set (NETSNMP_TRANSPORT_DTLSUDP_DOMAIN 1)
    set (NETSNMP_TRANSPORT_TLSBASE_DOMAIN 1)
    set (NETSNMP_TRANSPORT_TLSTCP_DOMAIN 1)
endif ()

include(CheckMyTypeAndSymbol)

if (${SIZEOF_SIZE_T} STREQUAL ${SIZEOF_LONG})
    set (NETSNMP_PRIz "\"l\"")
elseif (${SIZEOF_SIZE_T} STREQUAL ${SIZEOF_LONG_LONG})
    set (NETSNMP_PRIz "\"ll\"")
else ()
    set (NETSNMP_PRIz "")
endif ()

configure_file (${PROJECT_SOURCE_DIR}/include/net-snmp/net-snmp-config.h.cmake
    ${PROJECT_BINARY_DIR}/include/net-snmp/net-snmp-config.h )
configure_file (${PROJECT_SOURCE_DIR}/include/net-snmp/agent/agent_module_config.h.cmake
    ${PROJECT_BINARY_DIR}/include/net-snmp/agent/agent_module_config.h )
configure_file (${PROJECT_SOURCE_DIR}/include/net-snmp/agent/mib_module_config.h.cmake
    ${PROJECT_BINARY_DIR}/include/net-snmp/agent/mib_module_config.h )
configure_file (${PROJECT_SOURCE_DIR}/include/net-snmp/library/snmpv3-security-includes.h.cmake
    ${PROJECT_BINARY_DIR}/include/net-snmp/library/snmpv3-security-includes.h )

## Process sub-components
add_subdirectory (agent)
add_subdirectory (apps)
add_subdirectory (snmplib)
