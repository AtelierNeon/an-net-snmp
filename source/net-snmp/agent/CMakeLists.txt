## Add include directories
include_directories (
    ${PROJECT_SOURCE_DIR}/agent
    ${PROJECT_SOURCE_DIR}/agent/mibgroup
    ${PROJECT_SOURCE_DIR}/include
    ${PROJECT_BINARY_DIR}/include)

## Component - netsnmpagent
set (NETSNMP_NETSNMPAGENTLIB_NAME
    netsnmpagent)
set (NETSNMP_NETSNMPAGENTLIB_SRCS
    agent_handler.c
    agent_index.c
    agent_read_config.c
    agent_registry.c
    agent_sysORTable.c
    agent_trap.c
    snmp_agent.c
    snmp_vars.c)
if (NOT WIN32)
    set (NETSNMP_NETSNMPAGENTLIB_SRCS
        ${NETSNMP_NETSNMPAGENTLIB_SRCS}
        netsnmp_close_fds.c)
endif ()
set (NETSNMP_NETSNMPAGENTLIB_LIBDEPS
    netsnmp)
set (NETSNMP_NETSNMPAGENTLIB_LIBTYPE
    STATIC)
add_library (${NETSNMP_NETSNMPAGENTLIB_NAME} ${NETSNMP_NETSNMPAGENTLIB_LIBTYPE}
    ${NETSNMP_NETSNMPAGENTLIB_SRCS})
target_link_libraries (${NETSNMP_NETSNMPAGENTLIB_NAME}
    ${NETSNMP_NETSNMPAGENTLIB_LIBDEPS})
install (TARGETS ${NETSNMP_NETSNMPAGENTLIB_NAME}
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib)

## Process sub-components
add_subdirectory (mibgroup)
