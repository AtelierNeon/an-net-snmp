## Add include directories
include_directories (
    ${PROJECT_SOURCE_DIR}/agent
    ${PROJECT_SOURCE_DIR}/agent/mibgroup
    ${PROJECT_SOURCE_DIR}/include
    ${PROJECT_BINARY_DIR}/include)

## Component - libnetsnmpagent
set (NETSNMP_LIBNETSNMPAGENT_NAME
    libnetsnmpagent)
set (NETSNMP_LIBNETSNMPAGENT_SRCS
    agent_handler.c
    agent_index.c
    agent_read_config.c
    agent_registry.c
    agent_sysORTable.c
    agent_trap.c
    helpers/all_helpers.c
    helpers/baby_steps.c
    helpers/bulk_to_next.c
    helpers/cache_handler.c
    helpers/debug_handler.c
    helpers/instance.c
    helpers/mode_end_call.c
    helpers/multiplexer.c
    helpers/null.c
    helpers/old_api.c
    helpers/read_only.c
    helpers/row_merge.c
    helpers/scalar.c
    helpers/scalar_group.c
    helpers/serialize.c
    helpers/snmp_get_statistic.c
    helpers/stash_cache.c
    helpers/stash_to_next.c
    helpers/table.c
    helpers/table_array.c
    helpers/table_container.c
    helpers/table_data.c
    helpers/table_dataset.c
    helpers/table_iterator.c
    helpers/table_tdata.c
    helpers/watcher.c
    snmp_agent.c
    snmp_vars.c)
if (NOT WIN32)
    set (NETSNMP_LIBNETSNMPAGENT_SRCS
        ${NETSNMP_LIBNETSNMPAGENT_SRCS}
        netsnmp_close_fds.c)
endif ()
set (NETSNMP_LIBNETSNMPAGENT_LIBDEPS
    libnetsnmp)
set (NETSNMP_LIBNETSNMPAGENT_LIBTYPE
    STATIC)
add_library (${NETSNMP_LIBNETSNMPAGENT_NAME} ${NETSNMP_LIBNETSNMPAGENT_LIBTYPE}
    ${NETSNMP_LIBNETSNMPAGENT_SRCS})
set_target_properties(${NETSNMP_LIBNETSNMPAGENT_NAME}
    PROPERTIES PREFIX "")
target_link_libraries (${NETSNMP_LIBNETSNMPAGENT_NAME}
    ${NETSNMP_LIBNETSNMPAGENT_LIBDEPS})

## Process sub-components
add_subdirectory (mibgroup)
