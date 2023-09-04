## Add include directories
include_directories (
    ${PROJECT_SOURCE_DIR}/agent)

## Component - netsnmpmibs
set (NETSNMP_NETSNMPMIBSLIB_NAME
    netsnmpmibs)
set (NETSNMP_NETSNMPMIBSLIB_SRCS
    mibII/setSerialNo.c
    mibII/snmp_mib.c
    mibII/sysORTable.c
    mibII/system_mib.c
    mibII/updates.c
    mibII/vacm_context.c
    mibII/vacm_conf.c
    mibII/vacm_vars.c
    disman/event/mteEvent.c
    disman/event/mteEventConf.c
    disman/event/mteEventNotificationTable.c
    disman/event/mteEventSetTable.c
    disman/event/mteEventTable.c
    disman/event/mteObjects.c
    disman/event/mteObjectsConf.c
    disman/event/mteObjectsTable.c
    disman/event/mteScalars.c
    disman/event/mteTrigger.c
    disman/event/mteTriggerBooleanTable.c
    disman/event/mteTriggerConf.c
    disman/event/mteTriggerDeltaTable.c
    disman/event/mteTriggerExistenceTable.c
    disman/event/mteTriggerTable.c
    disman/event/mteTriggerThresholdTable.c
    examples/example.c
    examples/ucdDemoPublic.c
    ucd-snmp/disk.c
    ucd-snmp/dlmod.c
    ucd-snmp/errormib.c
    ucd-snmp/extensible.c
    ucd-snmp/file.c)
set (NETSNMP_NETSNMPMIBSLIB_SRCS
    ${NETSNMP_NETSNMPMIBSLIB_SRCS}
    ucd-snmp/loadave.c
    ucd-snmp/pass.c
    ucd-snmp/pass_common.c
    ucd-snmp/pass_persist.c
    ucd-snmp/proc.c
    ucd-snmp/proxy.c
    ucd-snmp/versioninfo.c
    snmpv3/snmpEngine.c
    snmpv3/snmpMPDStats.c
    snmpv3/usmConf.c
    snmpv3/usmStats.c
    snmpv3/usmUser.c
    notification/snmpNotifyFilterProfileTable.c
    notification/snmpNotifyFilterProfileTable_data.c
    snmp-notification-mib/snmpNotifyFilterTable/snmpNotifyFilterTable.c
    snmp-notification-mib/snmpNotifyFilterTable/snmpNotifyFilterTable_data_access.c
    snmp-notification-mib/snmpNotifyFilterTable/snmpNotifyFilterTable_data_storage.c
    snmp-notification-mib/snmpNotifyFilterTable/snmpNotifyFilterTable_interface.c
    notification/snmpNotifyTable.c
    notification/snmpNotifyTable_data.c
    target/snmpTargetAddrEntry.c
    target/snmpTargetAddrEntry_data.c
    target/snmpTargetParamsEntry.c
    target/snmpTargetParamsEntry_data.c
    target/target.c
    target/target_counters.c
    agentx/agentx_config.c
    agentx/client.c
    agentx/master.c
    agentx/master_admin.c
    agentx/protocol.c
    agentx/subagent.c
    agent/extend.c
    agent/nsCache.c
    agent/nsDebug.c
    agent/nsLogging.c
    agent/nsModuleTable.c
    agent/nsTransactionTable.c
    utilities/execute.c
    utilities/iquery.c
    utilities/override.c
    util_funcs/header_generic.c
    util_funcs/header_simple_table.c
    header_complex.c
    ../helpers/all_helpers.c
    ../helpers/baby_steps.c
    ../helpers/bulk_to_next.c
    ../helpers/cache_handler.c
    ../helpers/debug_handler.c
    ../helpers/instance.c
    ../helpers/mode_end_call.c
    ../helpers/multiplexer.c
    ../helpers/null.c
    ../helpers/old_api.c
    ../helpers/read_only.c
    ../helpers/row_merge.c
    ../helpers/scalar.c
    ../helpers/scalar_group.c
    ../helpers/serialize.c
    ../helpers/snmp_get_statistic.c
    ../helpers/stash_cache.c
    ../helpers/stash_to_next.c
    ../helpers/table.c
    ../helpers/table_array.c
    ../helpers/table_container.c
    ../helpers/table_data.c
    ../helpers/table_dataset.c
    ../helpers/table_iterator.c
    ../helpers/table_tdata.c
    ../helpers/watcher.c
    ../mib_modules.c
    util_funcs.c
    util_funcs/Exit.c
    util_funcs/restart.c
    smux/smux.c)
if (NETSNMP_WITH_SDK)
    set (NETSNMP_NETSNMPMIBSLIB_SRCS
        ${NETSNMP_NETSNMPMIBSLIB_SRCS}
        mibII/at.c
        mibII/icmp.c
        mibII/interfaces.c
        notification-log-mib/notification_log.c
        winExtDLL.c)
    if (WIN32)
        set (NETSNMP_NETSNMPMIBSLIB_SRCS
            ${NETSNMP_NETSNMPMIBSLIB_SRCS}
            mibII/data_access/at_iphlpapi.c)
    endif ()
    if (NOT APPLE)
        set (NETSNMP_NETSNMPMIBSLIB_SRCS
            ${NETSNMP_NETSNMPMIBSLIB_SRCS}
            mibII/ip.c
            mibII/ipAddr.c
            mibII/route_write.c
            mibII/tcp.c
            mibII/tcpTable.c
            mibII/udp.c
            mibII/udpTable.c
            mibII/var_route.c)
        if (UNIX)
            set (NETSNMP_NETSNMPMIBSLIB_SRCS
                ${NETSNMP_NETSNMPMIBSLIB_SRCS}
                mibII/ipv6.c)
        endif ()
    endif ()
endif ()
set (NETSNMP_NETSNMPMIBSLIB_LIBDEPS
    netsnmp)
set (NETSNMP_NETSNMPMIBSLIB_LIBTYPE
    STATIC)
add_library (${NETSNMP_NETSNMPMIBSLIB_NAME} ${NETSNMP_NETSNMPMIBSLIB_LIBTYPE}
    ${NETSNMP_NETSNMPMIBSLIB_SRCS})
target_link_libraries (${NETSNMP_NETSNMPMIBSLIB_NAME}
    ${NETSNMP_NETSNMPMIBSLIB_LIBDEPS})
install (TARGETS ${NETSNMP_NETSNMPMIBSLIB_NAME}
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib)
