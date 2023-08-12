## Import custom CMake modules
if (WIN32)
    include (Windows-MyDllVersion)
endif ()

## Add include directories
include_directories (
    ${PROJECT_SOURCE_DIR}/include
    ${PROJECT_BINARY_DIR}/include
    ${PROJECT_SOURCE_DIR}/snmplib)
if (NETSNMP_WITH_SSL)
    include_directories (
        ${OPENSSL_INCLUDE_DIRS})
endif ()

## Component - libnetsnmp
set (NETSNMP_LIBNETSNMP_NAME
    libnetsnmp)
set (NETSNMP_LIBNETSNMP_SRCS
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
    #transports/snmpSSHDomain.c
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
    set (NETSNMP_LIBNETSNMP_SRCS
        ${NETSNMP_LIBNETSNMP_SRCS}
        closedir.c
        gettimeofday.c
        opendir.c
        readdir.c)
else ()
    set (NETSNMP_LIBNETSNMP_SRCS
        ${NETSNMP_LIBNETSNMP_SRCS}
        sd-daemon.c
        transports/snmpIPXDomain.c
        transports/snmpSTDDomain.c
        transports/snmpUnixDomain.c)
endif ()
set (NETSNMP_LIBNETSNMP_LIBDEPS
    "")
set (NETSNMP_LIBNETSNMP_LIBTYPE
    STATIC)
if (WIN32)
    generate_product_dll_version(NETSNMP_LIBNETSNMP_VERSION_FILES
        NAME "${NETSNMP_LIBNETSNMP_NAME} - The Net-SNMP library"
        BUNDLE "Net-SNMP"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_LIBNETSNMP_NAME}.dll")
    set (NETSNMP_LIBNETSNMP_SRCS
        ${NETSNMP_LIBNETSNMP_SRCS}
        ${NETSNMP_LIBNETSNMP_VERSION_FILES})
    set (NETSNMP_LIBNETSNMP_LIBDEPS
        ${NETSNMP_LIBNETSNMP_LIBDEPS}
        ws2_32
        advapi32)
endif ()
if (NETSNMP_WITH_SDK)
    set (NETSNMP_LIBNETSNMP_SRCS
        ${NETSNMP_LIBNETSNMP_SRCS}
        transports/snmpIPv6BaseDomain.c
        transports/snmpTCPIPv6Domain.c
        transports/snmpUDPIPv6Domain.c)
endif ()
if (NETSNMP_WITH_SSL)
    set (NETSNMP_LIBNETSNMP_SRCS
        ${NETSNMP_LIBNETSNMP_SRCS}
        transports/snmpDTLSUDPDomain.c
        transports/snmpTLSBaseDomain.c
        transports/snmpTLSTCPDomain.c
        snmp_openssl.c)
    set (NETSNMP_LIBNETSNMP_LIBDEPS
        ${NETSNMP_LIBNETSNMP_LIBDEPS}
        ${OPENSSL_LIBRARIES})
endif ()
if (NETSNMP_WITH_SHARED_LIBRARIES)
    set (NETSNMP_LIBNETSNMP_LIBTYPE SHARED)
endif ()
add_library (${NETSNMP_LIBNETSNMP_NAME} ${NETSNMP_LIBNETSNMP_LIBTYPE}
    ${NETSNMP_LIBNETSNMP_SRCS})
target_link_libraries (${NETSNMP_LIBNETSNMP_NAME}
    ${NETSNMP_LIBNETSNMP_LIBDEPS})
if (NETSNMP_WITH_SHARED_LIBRARIES)
    target_compile_definitions (${NETSNMP_LIBNETSNMP_NAME} PRIVATE
        NETSNMP_DLL
        NETSNMP_USE_DLL)
endif ()
install (TARGETS ${NETSNMP_LIBNETSNMP_NAME}
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib)
