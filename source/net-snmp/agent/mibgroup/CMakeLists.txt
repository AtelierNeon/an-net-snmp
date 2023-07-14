## Add include directories
include_directories (
    ${netsnmp_SOURCE_DIR}/agent)

## Component - libnetsnmpmibs
set (NETSNMP_NETSNMPMIBSLIB_NAME
    libnetsnmpmibs)
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
    disman/event/mteTriggerBooleanTable.c
    disman/event/mteTrigger.c
    disman/event/mteTriggerConf.c
    disman/event/mteTriggerDeltaTable.c
    disman/event/mteTriggerExistenceTable.c
    disman/event/mteTriggerTable.c
    disman/event/mteTriggerThresholdTable.c
    examples/example.c
    examples/ucdDemoPublic.c
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
    ../mib_modules.c
    util_funcs.c
    util_funcs/Exit.c
    util_funcs/restart.c
    smux/smux.c)
if (NETSNMP_WITH_SDK)
    set (NETSNMP_NETSNMPMIBSLIB_SRCS
        ${NETSNMP_NETSNMPMIBSLIB_SRCS}
        mibII/at.c
        mibII/data_access/at_iphlpapi.c
        mibII/icmp.c
        mibII/interfaces.c
        mibII/ip.c
        mibII/ipAddr.c
        notification-log-mib/notification_log.c
        mibII/route_write.c
        mibII/tcp.c
        mibII/tcpTable.c
        mibII/udp.c
        mibII/udpTable.c
        mibII/var_route.c
        winExtDLL.c)
endif ()
set (NETSNMP_NETSNMPMIBSLIB_LIBDEPS
    libnetsnmp)
set (NETSNMP_NETSNMPMIBSLIB_LIBTYPE
    STATIC)
add_library (${NETSNMP_NETSNMPMIBSLIB_NAME} ${NETSNMP_NETSNMPMIBSLIB_LIBTYPE}
    ${NETSNMP_NETSNMPMIBSLIB_SRCS})
target_link_libraries (${NETSNMP_NETSNMPMIBSLIB_NAME}
    ${NETSNMP_NETSNMPMIBSLIB_LIBDEPS})
