## Import custom CMake modules
if (WIN32)
    include (Windows-MyDllVersion)
endif ()

## Add include directories
include_directories (
    ${PROJECT_SOURCE_DIR}/include
    ${PROJECT_BINARY_DIR}/include
    ${PROJECT_SOURCE_DIR}/snmplib)
if (NETSNMP_WITH_SSL AND OPENSSL_FOUND AND UNIX)
    include_directories (
        ${OPENSSL_INCLUDE_DIRS})
endif ()
if (NETSNMP_WITH_LIBSSH2 AND LIBSSH2_FOUND)
    include_directories (
        ${LIBSSH2_INCLUDE_DIRS})
endif ()

## Component - netsnmp
set (NETSNMP_NETSNMPLIB_NAME
    netsnmp)
set (NETSNMP_NETSNMPLIB_SRCS
    asn1.c
    asprintf.c
    callback.c
    cert_util.c
    check_varbind.c
    container.c
    container_binary_array.c
    container_iterator.c
    container_list_ssll.c
    container_null.c
    data_list.c
    default_store.c
    dir_utils.c
    fd_event_manager.c
    file_utils.c
    getopt.c
    inet_ntop.c
    inet_pton.c
    int64.c
    keytools.c
    large_fd_set.c
    lcd_time.c
    md5.c
    mib.c
    mt_support.c
    oid_stash.c
    parse.c
    read_config.c
    scapi.c
    snmp-tc.c
    snmp.c
    snmp_alarm.c
    snmp_api.c
    snmp_auth.c
    snmp_client.c
    snmp_debug.c
    snmp_enum.c
    snmp_logging.c
    snmp_parse_args.c
    snmp_secmod.c
    snmp_service.c
    snmp_transport.c
    snmp_version.c
    snmptsm.c
    snmpusm.c
    snmpv3.c
    strlcat.c
    strlcpy.c
    strtok_r.c
    strtoull.c
    system.c
    tools.c
    #transports/snmpAAL5PVCDomain.c
    transports/snmpAliasDomain.c
    transports/snmpCallbackDomain.c
    transports/snmpIPv4BaseDomain.c
    transports/snmpSocketBaseDomain.c
    transports/snmpTCPDomain.c
    transports/snmpTCPBaseDomain.c
    transports/snmpUDPBaseDomain.c
    transports/snmpUDPDomain.c
    transports/snmpUDPIPv4BaseDomain.c
    transports/snmpUDPsharedDomain.c
    ucd_compat.c
    vacm.c
    winpipe.c)
if (WIN32)
    set (NETSNMP_NETSNMPLIB_SRCS
        ${NETSNMP_NETSNMPLIB_SRCS}
        closedir.c
        gettimeofday.c
        opendir.c
        readdir.c)
endif ()
if (UNIX)
    set (NETSNMP_NETSNMPLIB_SRCS
        ${NETSNMP_NETSNMPLIB_SRCS}
        sd-daemon.c
        transports/snmpSTDDomain.c
        transports/snmpUnixDomain.c)
    if (NOT APPLE)
        set (NETSNMP_NETSNMPLIB_SRCS
            ${NETSNMP_NETSNMPLIB_SRCS}
            transports/snmpIPXDomain.c)
    endif ()
endif ()
set (NETSNMP_NETSNMPLIB_LIBDEPS
    "")
set (NETSNMP_NETSNMPLIB_LIBTYPE
    STATIC)
if (WIN32)
    generate_product_dll_version(NETSNMP_NETSNMPLIB_VERSION_FILES
        NAME "${NETSNMP_NETSNMPLIB_NAME} - The Net-SNMP library"
        BUNDLE "Net-SNMP"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_NETSNMPLIB_NAME}.dll")
    set (NETSNMP_NETSNMPLIB_SRCS
        ${NETSNMP_NETSNMPLIB_SRCS}
        ${NETSNMP_NETSNMPLIB_VERSION_FILES})
    set (NETSNMP_NETSNMPLIB_LIBDEPS
        ${NETSNMP_NETSNMPLIB_LIBDEPS}
        ws2_32
        advapi32)
endif ()
if (NETSNMP_WITH_SDK)
    set (NETSNMP_NETSNMPLIB_SRCS
        ${NETSNMP_NETSNMPLIB_SRCS}
        transports/snmpIPv6BaseDomain.c
        transports/snmpTCPIPv6Domain.c
        transports/snmpUDPIPv6Domain.c)
endif ()
if (NETSNMP_WITH_SSL AND OPENSSL_FOUND)
    set (NETSNMP_NETSNMPLIB_SRCS
        ${NETSNMP_NETSNMPLIB_SRCS}
        transports/snmpDTLSUDPDomain.c
        transports/snmpTLSBaseDomain.c
        transports/snmpTLSTCPDomain.c
        snmp_openssl.c)
    set (NETSNMP_NETSNMPLIB_LIBDEPS
        ${NETSNMP_NETSNMPLIB_LIBDEPS}
        ${OPENSSL_LIBRARIES})
endif ()
if (NETSNMP_WITH_LIBSSH2 AND LIBSSH2_FOUND AND UNIX)
    set (NETSNMP_NETSNMPLIB_SRCS
        ${NETSNMP_NETSNMPLIB_SRCS}
        transports/snmpSSHDomain.c)
    set (NETSNMP_NETSNMPLIB_LIBDEPS
        ${NETSNMP_NETSNMPLIB_LIBDEPS}
        ${LIBSSH2_LIBRARIES})
endif ()
if (NETSNMP_WITH_SHARED_LIBRARIES)
    set (NETSNMP_NETSNMPLIB_LIBTYPE SHARED)
endif ()
add_library (${NETSNMP_NETSNMPLIB_NAME} ${NETSNMP_NETSNMPLIB_LIBTYPE}
    ${NETSNMP_NETSNMPLIB_SRCS})
set_target_properties(${NETSNMP_NETSNMPLIB_NAME}
    PROPERTIES PREFIX "lib")
target_link_libraries (${NETSNMP_NETSNMPLIB_NAME}
    ${NETSNMP_NETSNMPLIB_LIBDEPS})
if (NETSNMP_WITH_SHARED_LIBRARIES)
    target_compile_definitions (${NETSNMP_NETSNMPLIB_NAME} PRIVATE
        NETSNMP_DLL
        NETSNMP_USE_DLL)
endif ()
install (TARGETS ${NETSNMP_NETSNMPLIB_NAME}
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib)
