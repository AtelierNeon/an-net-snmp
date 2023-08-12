## Import custom CMake modules
if (WIN32)
    include (Windows-MyExeVersion)
endif ()

## Add include directories
include_directories (
    ${PROJECT_SOURCE_DIR}/include
    ${PROJECT_BINARY_DIR}/include
    ${PROJECT_SOURCE_DIR}/agent/mibgroup)

## Component - libnetsnmptrapd
set (NETSNMP_LIBNETSNMPTRAPD_NAME
    libnetsnmptrapd)
set (NETSNMP_LIBNETSNMPTRAPD_SRCS
    snmptrapd.c
    snmptrapd_auth.c
    snmptrapd_handlers.c
    snmptrapd_log.c
    ../snmplib/winservice.c)
set (NETSNMP_LIBNETSNMPTRAPD_LIBDEPS
    libnetsnmp)
add_library (${NETSNMP_LIBNETSNMPTRAPD_NAME} STATIC
    ${NETSNMP_LIBNETSNMPTRAPD_SRCS})
target_link_libraries (${NETSNMP_LIBNETSNMPTRAPD_NAME}
    ${NETSNMP_LIBNETSNMPTRAPD_LIBDEPS})

## Component - encode_keychange
set (NETSNMP_ENCODE_KEYCHANGE_NAME
    encode_keychange)
set (NETSNMP_ENCODE_KEYCHANGE_SRCS
    encode_keychange.c)
set (NETSNMP_ENCODE_KEYCHANGE_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_ENCODE_KEYCHANGE_VERSION_FILES
        NAME "${NETSNMP_ENCODE_KEYCHANGE_NAME} - produce the KeyChange string for SNMPv3"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_ENCODE_KEYCHANGE_NAME}.exe")
    set (NETSNMP_ENCODE_KEYCHANGE_SRCS
        ${NETSNMP_ENCODE_KEYCHANGE_SRCS} ${NETSNMP_ENCODE_KEYCHANGE_VERSION_FILES})
endif ()
add_executable (${NETSNMP_ENCODE_KEYCHANGE_NAME}
    ${NETSNMP_ENCODE_KEYCHANGE_SRCS})
target_link_libraries (${NETSNMP_ENCODE_KEYCHANGE_NAME}
    ${NETSNMP_ENCODE_KEYCHANGE_LIBDEPS})
install (TARGETS ${NETSNMP_ENCODE_KEYCHANGE_NAME}
    RUNTIME DESTINATION bin)

## Component - snmpbulkget
set (NETSNMP_SNMPBULKGET_NAME
    snmpbulkget)
set (NETSNMP_SNMPBULKGET_SRCS
    snmpbulkget.c)
set (NETSNMP_SNMPBULKGET_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPBULKGET_VERSION_FILES
        NAME "${NETSNMP_SNMPBULKGET_NAME} - communicates with a network entity using SNMP GETBULK requests"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPBULKGET_NAME}.exe")
    set (NETSNMP_SNMPBULKGET_SRCS
        ${NETSNMP_SNMPBULKGET_SRCS} ${NETSNMP_SNMPBULKGET_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPBULKGET_NAME}
    ${NETSNMP_SNMPBULKGET_SRCS})
target_link_libraries (${NETSNMP_SNMPBULKGET_NAME}
    ${NETSNMP_SNMPBULKGET_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPBULKGET_NAME}
    RUNTIME DESTINATION bin)

## Component - snmpbulkwalk
set (NETSNMP_SNMPBULKWALK_NAME
    snmpbulkwalk)
set (NETSNMP_SNMPBULKWALK_SRCS
    snmpbulkwalk.c)
set (NETSNMP_SNMPBULKWALK_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPBULKWALK_VERSION_FILES
        NAME "${NETSNMP_SNMPBULKWALK_NAME} - retrieve a subtree of management values using SNMP GETBULK requests"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPBULKWALK_NAME}.exe")
    set (NETSNMP_SNMPBULKWALK_SRCS
        ${NETSNMP_SNMPBULKWALK_SRCS} ${NETSNMP_SNMPBULKWALK_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPBULKWALK_NAME}
    ${NETSNMP_SNMPBULKWALK_SRCS})
target_link_libraries (${NETSNMP_SNMPBULKWALK_NAME}
    ${NETSNMP_SNMPBULKWALK_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPBULKWALK_NAME}
    RUNTIME DESTINATION bin)

## Component - snmpd
set (NETSNMP_SNMPD_NAME
    snmpd)
set (NETSNMP_SNMPD_SRCS
    ../agent/auto_nlist.c
    ../agent/kernel.c
    ../agent/snmpd.c
    ../snmplib/winservice.c)
set (NETSNMP_SNMPD_LIBDEPS
    libnetsnmp
    libnetsnmpagent
    libnetsnmpmibs)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPD_VERSION_FILES
        NAME "${NETSNMP_SNMPD_NAME} - daemon to respond to SNMP request packets"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPD_NAME}.exe")
    set (NETSNMP_SNMPD_SRCS
        ${NETSNMP_SNMPD_SRCS} ${NETSNMP_SNMPD_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPD_NAME}
    ${NETSNMP_SNMPD_SRCS})
target_link_libraries (${NETSNMP_SNMPD_NAME}
    ${NETSNMP_SNMPD_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPD_NAME}
    RUNTIME DESTINATION bin)

## Component - snmpdelta
set (NETSNMP_SNMPDELTA_NAME
    snmpdelta)
set (NETSNMP_SNMPDELTA_SRCS
    snmpdelta.c)
set (NETSNMP_SNMPDELTA_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPDELTA_VERSION_FILES
        NAME "${NETSNMP_SNMPDELTA_NAME} - Monitor delta differences in SNMP Counter values"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPDELTA_NAME}.exe")
    set (NETSNMP_SNMPDELTA_SRCS
        ${NETSNMP_SNMPDELTA_SRCS} ${NETSNMP_SNMPDELTA_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPDELTA_NAME}
    ${NETSNMP_SNMPDELTA_SRCS})
target_link_libraries (${NETSNMP_SNMPDELTA_NAME}
    ${NETSNMP_SNMPDELTA_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPDELTA_NAME}
    RUNTIME DESTINATION bin)

## Component - snmpdf
set (NETSNMP_SNMPDF_NAME
    snmpdf)
set (NETSNMP_SNMPDF_SRCS
    snmpdf.c)
set (NETSNMP_SNMPDF_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPDF_VERSION_FILES
        NAME "${NETSNMP_SNMPDF_NAME} - display disk space usage on a network entity via SNMP"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPDF_NAME}.exe")
    set (NETSNMP_SNMPDF_SRCS
        ${NETSNMP_SNMPDF_SRCS} ${NETSNMP_SNMPDF_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPDF_NAME}
    ${NETSNMP_SNMPDF_SRCS})
target_link_libraries (${NETSNMP_SNMPDF_NAME}
    ${NETSNMP_SNMPDF_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPDF_NAME}
    RUNTIME DESTINATION bin)

## Component - snmpget
set (NETSNMP_SNMPGET_NAME
    snmpget)
set (NETSNMP_SNMPGET_SRCS
    snmpget.c)
set (NETSNMP_SNMPGET_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPGET_VERSION_FILES
        NAME "${NETSNMP_SNMPGET_NAME} - communicates with a network entity using SNMP GET requests"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPGET_NAME}.exe")
    set (NETSNMP_SNMPGET_SRCS
        ${NETSNMP_SNMPGET_SRCS} ${NETSNMP_SNMPGET_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPGET_NAME}
    ${NETSNMP_SNMPGET_SRCS})
target_link_libraries (${NETSNMP_SNMPGET_NAME}
    ${NETSNMP_SNMPGET_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPGET_NAME}
    RUNTIME DESTINATION bin)

## Component - snmpget
set (NETSNMP_SNMPGETNEXT_NAME
    snmpgetnext)
set (NETSNMP_SNMPGETNEXT_SRCS
    snmpgetnext.c)
set (NETSNMP_SNMPGETNEXT_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPGETNEXT_VERSION_FILES
        NAME "${NETSNMP_SNMPGETNEXT_NAME} - communicates with a network entity using SNMP GETNEXT requests"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPGETNEXT_NAME}.exe")
    set (NETSNMP_SNMPGETNEXT_SRCS
        ${NETSNMP_SNMPGETNEXT_SRCS} ${NETSNMP_SNMPGETNEXT_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPGETNEXT_NAME}
    ${NETSNMP_SNMPGETNEXT_SRCS})
target_link_libraries (${NETSNMP_SNMPGETNEXT_NAME}
    ${NETSNMP_SNMPGETNEXT_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPGETNEXT_NAME}
    RUNTIME DESTINATION bin)

## Component - snmpnetstat
set (NETSNMP_SNMPNETSTAT_NAME
    snmpnetstat)
set (NETSNMP_SNMPNETSTAT_SRCS
    snmpnetstat/if.c
    snmpnetstat/inet.c
    snmpnetstat/inet6.c
    snmpnetstat/inetx.c
    snmpnetstat/main.c
    snmpnetstat/route.c
    snmpnetstat/routex.c
    snmpnetstat/ffs.c
    snmpnetstat/winstub.c)
set (NETSNMP_SNMPNETSTAT_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPNETSTAT_VERSION_FILES
        NAME "${NETSNMP_SNMPNETSTAT_NAME} - display networking status and configuration information from a network entity via SNMP"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPNETSTAT_NAME}.exe")
    set (NETSNMP_SNMPNETSTAT_SRCS
        ${NETSNMP_SNMPNETSTAT_SRCS} ${NETSNMP_SNMPNETSTAT_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPNETSTAT_NAME}
    ${NETSNMP_SNMPNETSTAT_SRCS})
target_link_libraries (${NETSNMP_SNMPNETSTAT_NAME}
    ${NETSNMP_SNMPNETSTAT_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPNETSTAT_NAME}
    RUNTIME DESTINATION bin)

## Component - snmpset
set (NETSNMP_SNMPSET_NAME
    snmpset)
set (NETSNMP_SNMPSET_SRCS
    snmpset.c)
set (NETSNMP_SNMPSET_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPSET_VERSION_FILES
        NAME "${NETSNMP_SNMPSET_NAME} - communicates with a network entity using SNMP SET requests"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPSET_NAME}.exe")
    set (NETSNMP_SNMPSET_SRCS
        ${NETSNMP_SNMPSET_SRCS} ${NETSNMP_SNMPSET_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPSET_NAME}
    ${NETSNMP_SNMPSET_SRCS})
target_link_libraries (${NETSNMP_SNMPSET_NAME}
    ${NETSNMP_SNMPSET_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPSET_NAME}
    RUNTIME DESTINATION bin)

## Component - snmpstatus
set (NETSNMP_SNMPSTATUS_NAME
    snmpstatus)
set (NETSNMP_SNMPSTATUS_SRCS
    snmpstatus.c)
set (NETSNMP_SNMPSTATUS_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPSTATUS_VERSION_FILES
        NAME "${NETSNMP_SNMPSTATUS_NAME} - retrieves a fixed set of management information from a network entity"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPSTATUS_NAME}.exe")
    set (NETSNMP_SNMPSTATUS_SRCS
        ${NETSNMP_SNMPSTATUS_SRCS} ${NETSNMP_SNMPSTATUS_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPSTATUS_NAME}
    ${NETSNMP_SNMPSTATUS_SRCS})
target_link_libraries (${NETSNMP_SNMPSTATUS_NAME}
    ${NETSNMP_SNMPSTATUS_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPSTATUS_NAME}
    RUNTIME DESTINATION bin)

## Component - snmptable
set (NETSNMP_SNMPTABLE_NAME
    snmptable)
set (NETSNMP_SNMPTABLE_SRCS
    snmptable.c)
set (NETSNMP_SNMPTABLE_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPTABLE_VERSION_FILES
        NAME "${NETSNMP_SNMPTABLE_NAME} - retrieve an SNMP table and display it in tabular form"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPTABLE_NAME}.exe")
    set (NETSNMP_SNMPTABLE_SRCS
        ${NETSNMP_SNMPTABLE_SRCS} ${NETSNMP_SNMPTABLE_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPTABLE_NAME}
    ${NETSNMP_SNMPTABLE_SRCS})
target_link_libraries (${NETSNMP_SNMPTABLE_NAME}
    ${NETSNMP_SNMPTABLE_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPTABLE_NAME}
    RUNTIME DESTINATION bin)

## Component - snmptest
set (NETSNMP_SNMPTEST_NAME
    snmptest)
set (NETSNMP_SNMPTEST_SRCS
    snmptest.c)
set (NETSNMP_SNMPTEST_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPTEST_VERSION_FILES
        NAME "${NETSNMP_SNMPTEST_NAME} - communicates with a network entity using SNMP requests"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPTEST_NAME}.exe")
    set (NETSNMP_SNMPTEST_SRCS
        ${NETSNMP_SNMPTEST_SRCS} ${NETSNMP_SNMPTEST_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPTEST_NAME}
    ${NETSNMP_SNMPTEST_SRCS})
target_link_libraries (${NETSNMP_SNMPTEST_NAME}
    ${NETSNMP_SNMPTEST_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPTEST_NAME}
    RUNTIME DESTINATION bin)

## Component - snmptranslate
set (NETSNMP_SNMPTRANSLATE_NAME
    snmptranslate)
set (NETSNMP_SNMPTRANSLATE_SRCS
    snmptranslate.c)
set (NETSNMP_SNMPTRANSLATE_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPTRANSLATE_VERSION_FILES
        NAME "${NETSNMP_SNMPTRANSLATE_NAME} - translate MIB OID names between numeric and textual forms"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPTRANSLATE_NAME}.exe")
    set (NETSNMP_SNMPTRANSLATE_SRCS
        ${NETSNMP_SNMPTRANSLATE_SRCS} ${NETSNMP_SNMPTRANSLATE_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPTRANSLATE_NAME}
    ${NETSNMP_SNMPTRANSLATE_SRCS})
target_link_libraries (${NETSNMP_SNMPTRANSLATE_NAME}
    ${NETSNMP_SNMPTRANSLATE_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPTRANSLATE_NAME}
    RUNTIME DESTINATION bin)

## Component - snmptrap
set (NETSNMP_SNMPTRAP_NAME
    snmptrap)
set (NETSNMP_SNMPTRAP_SRCS
    snmptrap.c)
set (NETSNMP_SNMPTRAP_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPTRAP_VERSION_FILES
        NAME "${NETSNMP_SNMPTRAP_NAME} - sends an SNMP notification to a manager"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPTRAP_NAME}.exe")
    set (NETSNMP_SNMPTRAP_SRCS
        ${NETSNMP_SNMPTRAP_SRCS} ${NETSNMP_SNMPTRAP_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPTRAP_NAME}
    ${NETSNMP_SNMPTRAP_SRCS})
target_link_libraries (${NETSNMP_SNMPTRAP_NAME}
    ${NETSNMP_SNMPTRAP_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPTRAP_NAME}
    RUNTIME DESTINATION bin)

## Component - snmptrapd
set (NETSNMP_SNMPTRAPD_NAME
    snmptrapd)
set (NETSNMP_SNMPTRAPD_SRCS
    snmptrapd.c
    snmptrapd_handlers.c
    snmptrapd_log.c
    ../snmplib/winservice.c)
set (NETSNMP_SNMPTRAPD_LIBDEPS
    libnetsnmp
    libnetsnmpagent
    libnetsnmpmibs
    libnetsnmptrapd)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPTRAPD_VERSION_FILES
        NAME "${NETSNMP_SNMPTRAPD_NAME} - receive and log SNMP trap messages"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPTRAPD_NAME}.exe")
    set (NETSNMP_SNMPTRAPD_SRCS
        ${NETSNMP_SNMPTRAPD_SRCS} ${NETSNMP_SNMPTRAPD_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPTRAPD_NAME}
    ${NETSNMP_SNMPTRAPD_SRCS})
target_link_libraries (${NETSNMP_SNMPTRAPD_NAME}
    ${NETSNMP_SNMPTRAPD_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPTRAPD_NAME}
    RUNTIME DESTINATION bin)

## Component - snmpusm
set (NETSNMP_SNMPUSM_NAME
    snmpusm)
set (NETSNMP_SNMPUSM_SRCS
    snmpusm.c)
set (NETSNMP_SNMPUSM_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPUSM_VERSION_FILES
        NAME "${NETSNMP_SNMPUSM_NAME} - creates and maintains SNMPv3 users on a network entity"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPUSM_NAME}.exe")
    set (NETSNMP_SNMPUSM_SRCS
        ${NETSNMP_SNMPUSM_SRCS} ${NETSNMP_SNMPUSM_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPUSM_NAME}
    ${NETSNMP_SNMPUSM_SRCS})
target_link_libraries (${NETSNMP_SNMPUSM_NAME}
    ${NETSNMP_SNMPUSM_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPUSM_NAME}
    RUNTIME DESTINATION bin)

## Component - snmpvacm
set (NETSNMP_SNMPVACM_NAME
    snmpvacm)
set (NETSNMP_SNMPVACM_SRCS
    snmpvacm.c)
set (NETSNMP_SNMPVACM_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPVACM_VERSION_FILES
        NAME "${NETSNMP_SNMPVACM_NAME} - creates and maintains SNMPv3 View-based Access Control entries on a network entity"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPVACM_NAME}.exe")
    set (NETSNMP_SNMPVACM_SRCS
        ${NETSNMP_SNMPVACM_SRCS} ${NETSNMP_SNMPVACM_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPVACM_NAME}
    ${NETSNMP_SNMPVACM_SRCS})
target_link_libraries (${NETSNMP_SNMPVACM_NAME}
    ${NETSNMP_SNMPVACM_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPVACM_NAME}
    RUNTIME DESTINATION bin)

## Component - snmpwalk
set (NETSNMP_SNMPWALK_NAME
    snmpwalk)
set (NETSNMP_SNMPWALK_SRCS
    snmpwalk.c)
set (NETSNMP_SNMPWALK_LIBDEPS
    libnetsnmp)
if (WIN32)
    generate_product_exe_version (NETSNMP_SNMPWALK_VERSION_FILES
        NAME "${NETSNMP_SNMPWALK_NAME} - retrieve a subtree of management values using SNMP GETNEXT requests"
        BUNDLE "${PROJECT_DESCRIPTION}"
        ICON "${PROJECT_SOURCE_DIR}/net-snmp.ico"
        VERSION_MAJOR ${NETSNMP_VER_MAJOR}
        VERSION_MINOR ${NETSNMP_VER_MINOR}
        VERSION_PATCH ${NETSNMP_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "${NETSNMP_SNMPWALK_NAME}.exe")
    set (NETSNMP_SNMPWALK_SRCS
        ${NETSNMP_SNMPWALK_SRCS} ${NETSNMP_SNMPWALK_VERSION_FILES})
endif ()
add_executable (${NETSNMP_SNMPWALK_NAME}
    ${NETSNMP_SNMPWALK_SRCS})
target_link_libraries (${NETSNMP_SNMPWALK_NAME}
    ${NETSNMP_SNMPWALK_LIBDEPS})
install (TARGETS ${NETSNMP_SNMPWALK_NAME}
    RUNTIME DESTINATION bin)
