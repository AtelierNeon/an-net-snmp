macro (check_by_try_compile MY_TEST)
    message (STATUS "Performing My Test ${MY_TEST}")
    try_compile(${MY_TEST}
        ${CMAKE_BINARY_DIR}
        ${PROJECT_SOURCE_DIR}/cmake/CheckMyTypeAndSymbol.c
        OUTPUT_VARIABLE OUTPUT
    )
    if (${MY_TEST})
        set (${MY_TEST} 1)
        message (STATUS "Performing My Test ${MY_TEST} - Success")
    else ()
        message(STATUS "Performing My Test ${MY_TEST} - Failed")
        set (${MY_TEST} "")
        file (APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeError.log
            "Performing My Test ${MY_TEST} failed with the following output:\n"
            "${OUTPUT}\n")
    endif ()
endmacro ()


include (CheckIncludeFile)
check_include_file ("alloca.h" HAVE_ALLOCA_H)
check_include_file ("arpa/inet.h" HAVE_ARPA_INET_H)
check_include_file ("asm/page.h" HAVE_ASM_PAGE_H)
check_include_file ("asm/types.h" HAVE_ASM_TYPES_H)
check_include_file ("bsd/nlist.h" HAVE_BSD_NLIST_H)
check_include_file ("bsd/string.h" HAVE_BSD_STRING_H)
check_include_file ("com_err.h" HAVE_COM_ERR_H)
check_include_file ("curses.h" HAVE_CURSES_H)
check_include_file ("dirent.h" HAVE_DIRENT_H)
check_include_file ("dlfcn.h" HAVE_DLFCN_H)
check_include_file ("dmalloc.h" HAVE_DMALLOC_H)
check_include_file ("err.h" HAVE_ERR_H)
check_include_file ("et/com_err.h" HAVE_ET_COM_ERR_H)
check_include_file ("fcntl.h" HAVE_FCNTL_H)
check_include_file ("fstab.h" HAVE_FSTAB_H)
check_include_file ("getopt.h" HAVE_GETOPT_H)
check_include_file ("grp.h" HAVE_GRP_H)
check_include_file ("inet/common.h" HAVE_INET_COMMON_H)
check_include_file ("inet/ip.h" HAVE_INET_IP_H)
check_include_file ("inet/mib2.h" HAVE_INET_MIB2_H)
check_include_file ("inttypes.h" HAVE_INTTYPES_H)
check_include_file ("io.h" HAVE_IO_H)
check_include_file ("ioctls.h" HAVE_IOCTLS_H)
check_include_file ("iphlpapi.h" HAVE_IPHLPAPI_H)
check_include_file ("kstat.h" HAVE_KSTAT_H)
check_include_file ("kvm.h" HAVE_KVM_H)
check_include_file ("libperfstat.h" HAVE_LIBPERFSTAT_H)
check_include_file ("limits.h" HAVE_LIMITS_H)
check_include_file ("linux/ethtool.h" HAVE_LINUX_ETHTOOL_H)
check_include_file ("linux/hdreg.h" HAVE_LINUX_HDREG_H)
check_include_file ("linux/netlink.h" HAVE_LINUX_NETLINK_H)
check_include_file ("linux/rtnetlink.h" HAVE_LINUX_RTNETLINK_H)
check_include_file ("linux/tasks.h" HAVE_LINUX_TASKS_H)
check_include_file ("locale.h" HAVE_LOCALE_H)
check_include_file ("machine/param.h" HAVE_MACHINE_PARAM_H)
check_include_file ("machine/pte.h" HAVE_MACHINE_PTE_H)
check_include_file ("machine/types.h" HAVE_MACHINE_TYPES_H)
check_include_file ("malloc.h" HAVE_MALLOC_H)
check_include_file ("memory.h" HAVE_MEMORY_H)
check_include_file ("mntent.h" HAVE_MNTENT_H)
check_include_file ("mtab.h" HAVE_MTAB_H)
check_include_file ("nbutil.h" HAVE_NBUTIL_H)
check_include_file ("ncurses/curses.h" HAVE_NCURSES_CURSES_H)
check_include_file ("ndir.h" HAVE_NDIR_H)
check_include_file ("netdb.h" HAVE_NETDB_H)
check_include_file ("netinet/icmp6.h" HAVE_NETINET_ICMP6_H)
check_include_file ("netinet/icmp_var.h" HAVE_NETINET_ICMP_VAR_H)
check_include_file ("netinet/if_ether.h" HAVE_NETINET_IF_ETHER_H)
check_include_file ("netinet/in.h" HAVE_NETINET_IN_H)
check_include_file ("netinet/in_pcb.h" HAVE_NETINET_IN_PCB_H)
check_include_file ("netinet/in_systm.h" HAVE_NETINET_IN_SYSTM_H)
check_include_file ("netinet/in_var.h" HAVE_NETINET_IN_VAR_H)
check_include_file ("netinet/ip_icmp.h" HAVE_NETINET_IP_ICMP_H)
check_include_file ("netinet/ip6.h" HAVE_NETINET_IP6_H)
check_include_file ("netinet/ip.h" HAVE_NETINET_IP_H)
check_include_file ("netinet/ip_var.h" HAVE_NETINET_IP_VAR_H)
check_include_file ("netinet/tcpip.h" HAVE_NETINET_TCPIP_H)
check_include_file ("netinet/tcp.h" HAVE_NETINET_TCP_H)
check_include_file ("netinet/tcp_fsm.h" HAVE_NETINET_TCP_FSM_H)
check_include_file ("netinet/tcp_timer.h" HAVE_NETINET_TCP_TIMER_H)
check_include_file ("netinet/tcp_var.h" HAVE_NETINET_TCP_VAR_H)
check_include_file ("netinet/udp.h" HAVE_NETINET_UDP_H)
check_include_file ("netinet/udp_var.h" HAVE_NETINET_UDP_VAR_H)
check_include_file ("netinet6/in6_pcb.h" HAVE_NETINET6_IN6_PCB_H)
check_include_file ("netinet6/in6_var.h" HAVE_NETINET6_IN6_VAR_H)
check_include_file ("netinet6/ip6_var.h" HAVE_NETINET6_IP6_VAR_H)
check_include_file ("netinet6/nd6.h" HAVE_NETINET6_ND6_H)
check_include_file ("netinet6/tcp6_fsm.h" HAVE_NETINET6_TCP6_FSM_H)
check_include_file ("netinet6/tcp6.h" HAVE_NETINET6_TCP6_H)
check_include_file ("netinet6/tcp6_timer.h" HAVE_NETINET6_TCP6_TIMER_H)
check_include_file ("netinet6/tcp6_var.h" HAVE_NETINET6_TCP6_VAR_H)
check_include_file ("netipx/ipx.h" HAVE_NETIPX_IPX_H)
check_include_file ("netlink/netlink.h" HAVE_NETLINK_NETLINK_H)
check_include_file ("net/if.h" HAVE_NET_IF_H)
check_include_file ("net/if_arp.h" HAVE_NET_IF_ARP_H)
check_include_file ("net/if_dl.h" HAVE_NET_IF_DL_H)
check_include_file ("net/if_mib.h" HAVE_NET_IF_MIB_H)
check_include_file ("net/if_types.h" HAVE_NET_IF_TYPES_H)
check_include_file ("net/if_var.h" HAVE_NET_IF_VAR_H)
check_include_file ("net/route.h" HAVE_NET_ROUTE_H)
check_include_file ("osreldate.h" HAVE_OSRELDATE_H)
check_include_file ("pcap/pcap.h" HAVE_PCAP_PCAP_H)
check_include_file ("pci/pci.h" HAVE_PCI_PCI_H)
check_include_file ("pcre.h" HAVE_PCRE_H)
check_include_file ("picl.h" HAVE_PICL_H)
check_include_file ("pkginfo.h" HAVE_PKGINFO_H)
check_include_file ("pkglocs.h" HAVE_PKGLOCS_H)
check_include_file ("pkg.h" HAVE_PKG_H)
check_include_file ("poll.h" HAVE_POLL_H)
check_include_file ("pthread.h" HAVE_PTHREAD_H)
check_include_file ("pwd.h" HAVE_PWD_H)
check_include_file ("regex.h" HAVE_REGEX_H)
check_include_file ("rpm/header.h" HAVE_RPM_HEADER_H)
check_include_file ("rpm/rpmfileutil.h" HAVE_RPM_RPMFILEUTIL_H)
check_include_file ("rpm/rpmlib.h" HAVE_RPM_RPMLIB_H)
check_include_file ("rpm/rpmts.h" HAVE_RPM_RPMTS_H)
check_include_file ("search.h" HAVE_SEARCH_H)
check_include_file ("security/cryptoki.h" HAVE_SECURITY_CRYPTOKI_H)
check_include_file ("sensors/sensors.h" HAVE_SENSORS_SENSORS_H)
check_include_file ("sgtty.h" HAVE_SGTTY_H)
check_include_file ("signal.h" HAVE_SIGNAL_H)
check_include_file ("stdint.h" HAVE_STDINT_H)
check_include_file ("stdio.h" HAVE_STDIO_H)
check_include_file ("stdlib.h" HAVE_STDLIB_H)
check_include_file ("string.h" HAVE_STRING_H)
check_include_file ("strings.h" HAVE_STRINGS_H)
check_include_file ("sys/cdefs.h" HAVE_SYS_CDEFS_H)
check_include_file ("sys/conf.h" HAVE_SYS_CONF_H)
check_include_file ("sys/dir.h" HAVE_SYS_DIR_H)
check_include_file ("sys/diskio.h" HAVE_SYS_DISKIO_H)
check_include_file ("sys/disklabel.h" HAVE_SYS_DISKLABEL_H)
check_include_file ("sys/dkio.h" HAVE_SYS_DKIO_H)
check_include_file ("sys/dkstat.h" HAVE_SYS_DKSTAT_H)
check_include_file ("sys/dmap.h" HAVE_SYS_DMAP_H)
check_include_file ("sys/file.h" HAVE_SYS_FILE_H)
check_include_file ("sys/filio.h" HAVE_SYS_FILIO_H)
check_include_file ("sys/fixpoint.h" HAVE_SYS_FIXPOINT_H)
check_include_file ("sys/fs.h" HAVE_SYS_FS_H)
check_include_file ("sys/hashing.h" HAVE_SYS_HASHING_H)
check_include_file ("sys/ioctl.h" HAVE_SYS_IOCTL_H)
check_include_file ("sys/loadavg.h" HAVE_SYS_LOADAVG_H)
check_include_file ("sys/mbuf.h" HAVE_SYS_MBUF_H)
check_include_file ("sys/mntent.h" HAVE_SYS_MNTENT_H)
check_include_file ("sys/mnttab.h" HAVE_SYS_MNTTAB_H)
check_include_file ("sys/mount.h" HAVE_SYS_MOUNT_H)
check_include_file ("sys/ndir.h" HAVE_SYS_NDIR_H)
check_include_file ("sys/param.h" HAVE_SYS_PARAM_H)
check_include_file ("sys/poll.h" HAVE_SYS_POLL_H)
check_include_file ("sys/pool.h" HAVE_SYS_POOL_H)
check_include_file ("sys/proc.h" HAVE_SYS_PROC_H)
check_include_file ("sys/protosw.h" HAVE_SYS_PROTOSW_H)
check_include_file ("sys/pstat.h" HAVE_SYS_PSTAT_H)
check_include_file ("sys/queue.h" HAVE_SYS_QUEUE_H)
check_include_file ("sys/select.h" HAVE_SYS_SELECT_H)
check_include_file ("sys/sema.h" HAVE_SYS_SEMA_H)
check_include_file ("sys/socket.h" HAVE_SYS_SOCKET_H)
check_include_file ("sys/sockio.h" HAVE_SYS_SOCKIO_H)
check_include_file ("sys/stat.h" HAVE_SYS_STAT_H)
check_include_file ("sys/statfs.h" HAVE_SYS_STATFS_H)
check_include_file ("sys/statvfs.h" HAVE_SYS_STATVFS_H)
check_include_file ("sys/stream.h" HAVE_SYS_STREAM_H)
check_include_file ("sys/swap.h" HAVE_SYS_SWAP_H)
check_include_file ("sys/sysctl.h" HAVE_SYS_SYSCTL_H)
check_include_file ("sys/sysget.h" HAVE_SYS_SYSGET_H)
check_include_file ("sys/syslog.h" HAVE_SYS_SYSLOG_H)
check_include_file ("sys/sysmacros.h" HAVE_SYS_SYSMACROS_H)
check_include_file ("sys/sysmp.h" HAVE_SYS_SYSMP_H)
check_include_file ("sys/systemcfg.h" HAVE_SYS_SYSTEMCFG_H)
check_include_file ("sys/systeminfo.h" HAVE_SYS_SYSTEMINFO_H)
check_include_file ("sys/tcpipstats.h" HAVE_SYS_TCPIPSTATS_H)
check_include_file ("sys/timeout.h" HAVE_SYS_TIMEOUT_H)
check_include_file ("sys/time.h" HAVE_SYS_TIME_H)
check_include_file ("sys/timeb.h" HAVE_SYS_TIMEB_H)
check_include_file ("sys/times.h" HAVE_SYS_TIMES_H)
check_include_file ("sys/types.h" HAVE_SYS_TYPES_H)
check_include_file ("sys/ucred.h" HAVE_SYS_UCRED_H)
check_include_file ("sys/uio.h" HAVE_SYS_UIO_H)
check_include_file ("sys/un.h" HAVE_SYS_UN_H)
check_include_file ("sys/user.h" HAVE_SYS_USER_H)
check_include_file ("sys/utsname.h" HAVE_SYS_UTSNAME_H)
check_include_file ("sys/vfs.h" HAVE_SYS_VFS_H)
check_include_file ("sys/vmmac.h" HAVE_SYS_VMMAC_H)
check_include_file ("sys/vmmeter.h" HAVE_SYS_VMMETER_H)
check_include_file ("sys/vmparam.h" HAVE_SYS_VMPARAM_H)
check_include_file ("sys/vmsystm.h" HAVE_SYS_VMSYSTM_H)
check_include_file ("sys/vm.h" HAVE_SYS_VM_H)
check_include_file ("sys/vnode.h" HAVE_SYS_VNODE_H)
check_include_file ("sys/wait.h" HAVE_SYS_WAIT_H)
check_include_file ("syslog.h" HAVE_SYSLOG_H)
check_include_file ("termios.h" HAVE_TERMIOS_H)
check_include_file ("time.h" HAVE_TIME_H)
check_include_file ("ufs/ffs/fs.h" HAVE_UFS_FFS_FS_H)
check_include_file ("ufs/fs.h" HAVE_UFS_FS_H)
check_include_file ("ufs/ufs/dinode.h" HAVE_UFS_UFS_DINODE_H)
check_include_file ("ufs/ufs/inode.h" HAVE_UFS_UFS_INODE_H)
check_include_file ("ufs/ufs/quota.h" HAVE_UFS_UFS_QUOTA_H)
check_include_file ("unistd.h" HAVE_UNISTD_H)
check_include_file ("utmpx.h" HAVE_UTMPX_H)
check_include_file ("utsname.h" HAVE_UTSNAME_H)
check_include_file ("uvm/uvm_extern.h" HAVE_UVM_UVM_EXTERN_H)
check_include_file ("uvm/uvm_param.h" HAVE_UVM_UVM_PARAM_H)
check_include_file ("valgrind/memcheck.h" HAVE_VALGRIND_MEMCHECK_H)
check_include_file ("valgrind/valgrind.h" HAVE_VALGRIND_VALGRIND_H)
check_include_file ("validator/validator-config.h" HAVE_VALIDATOR_VALIDATOR_CONFIG_H)
check_include_file ("vm/swap_pager.h" HAVE_VM_SWAP_PAGER_H)
check_include_file ("vm/vm_extern.h" HAVE_VM_VM_EXTERN_H)
check_include_file ("vm/vm_param.h" HAVE_VM_VM_PARAM_H)
check_include_file ("vm/vm.h" HAVE_VM_VM_H)
check_include_file ("windows.h" HAVE_WINDOWS_H)
check_include_file ("winsock.h" HAVE_WINSOCK_H)
check_include_file ("winsock2.h" HAVE_WINSOCK2_H)
check_include_file ("ws2tcpip.h" HAVE_WS2TCPIP_H)
check_include_file ("xti.h" HAVE_XTI_H)

include (CheckTypeSize)
check_type_size ("int" SIZEOF_INT)
check_type_size ("intmax_t" HAVE_INTMAX_T)
check_type_size ("intmax_t" SIZEOF_INTMAX_T)
check_type_size ("intptr_t" HAVE_INTPTR_T)
check_type_size ("long" SIZEOF_LONG)
check_type_size ("long long" SIZEOF_LONG_LONG)
check_type_size ("long long int" HAVE_LONG_LONG_INT)
check_type_size ("short" SIZEOF_SHORT)
check_type_size ("size_t" SIZEOF_SIZE_T)
check_type_size ("socklen_t" HAVE_SOCKLEN_T)
check_type_size ("ssize_t" SSIZE_T)
check_type_size ("uintmax_t" HAVE_UINTMAX_T)
check_type_size ("uintptr_t" HAVE_UINTPTR_T)
check_type_size ("unsigned long long int" HAVE_UNSIGNED_LONG_LONG_INT)

include(CheckSymbolExists)
if (HAVE_STDIO_H)
    check_symbol_exists (asprintf "stdio.h" HAVE_ASPRINTF)
endif ()
if (HAVE_UNISTD_H)
    check_symbol_exists (chown "unistd.h" HAVE_CHOWN)
endif ()
if (HAVE_TIME_H)
    check_symbol_exists (clock_gettime "time.h" HAVE_CLOCK_GETTIME)
endif ()
if (HAVE_DIRENT_H)
    check_symbol_exists (closedir "dirent.h" HAVE_CLOSEDIR)
endif ()
if (HAVE_WINSOCK_H)
    check_symbol_exists (closesocket "winsock.h" HAVE_CLOSESOCKET)
endif ()
if (HAVE_DLFCN_H)
    check_symbol_exists (dlopen "dlfcn.h" HAVE_DLOPEN)
endif ()
if (HAVE_UNISTD_H)
    check_symbol_exists (execv "unistd.h" HAVE_EXECV)
endif ()
if (HAVE_STDIO_H)
    check_symbol_exists (fgetc_unlocked "stdio.h" HAVE_FGETC_UNLOCKED)
    check_symbol_exists (flockfile "stdio.h" HAVE_FLOCKFILE)
endif ()
if (HAVE_UNISTD_H)
    check_symbol_exists (fork "unistd.h" HAVE_FORK)
    check_symbol_exists (forkall "unistd.h" HAVE_FORKALL)
    check_symbol_exists (fsync "unistd.h" HAVE_FSYNC)
endif ()
if (HAVE_STDIO_H)
    check_symbol_exists (funlockfile "stdio.h" HAVE_FUNLOCKFILE)
endif ()
if (HAVE_SYS_TYPES_H OR HAVE_SYS_SOCKET_H OR HAVE_NETDB_H)
    check_symbol_exists (gai_strerror "sys/types.h;sys/socket.h;netdb.h" HAVE_GAI_STRERROR)
    check_symbol_exists (getaddrinfo "sys/types.h;sys/socket.h;netdb.h" HAVE_GETADDRINFO)
endif ()
if (HAVE_UNISTD_H)
    check_symbol_exists (getdtablesize "unistd.h" HAVE_GETDTABLESIZE)
endif ()
if (HAVE_STDIO_H OR HAVE_MNTENT_H)
    check_symbol_exists (getfsstat "stdio.h;mntent.h" HAVE_GETFSSTAT)
endif ()
if (HAVE_SYS_TYPES_H OR HAVE_GRP_H)
    check_symbol_exists (getgrnam "sys/types.h;grp.h" HAVE_GETGRNAM)
endif ()
if (HAVE_SYS_SOCKET_H OR HAVE_NETDB_H)
    check_symbol_exists (gethostbyaddr "sys/socket.h;netdb.h" HAVE_GETHOSTBYADDR)
    check_symbol_exists (gethostbyname "sys/socket.h;netdb.h" HAVE_GETHOSTBYNAME)
    check_symbol_exists (gethostbyname2 "sys/socket.h;netdb.h" HAVE_GETHOSTBYNAME2)
endif ()
if (HAVE_UNISTD_H)
    check_symbol_exists (gethostname "unistd.h" HAVE_GETHOSTNAME)
endif ()
if (HAVE_SYS_TYPES_H OR HAVE_SYS_SOCKET_H OR HAVE_NETDB_H)
    check_symbol_exists (getipnodebyname "sys/types.h;sys/socket.h;netdb.h" HAVE_GETIPNODEBYNAME)
endif ()
if (HAVE_STDLIB_H)
    check_symbol_exists (getloadavg "stdlib.h" HAVE_GETLOADAVG)
endif ()
if (HAVE_STDIO_H OR HAVE_MNTENT_H)
    check_symbol_exists (getmntent "stdio.h;mntent.h" HAVE_GETMNTENT)
endif ()
if (HAVE_UNISTD_H OR HAVE_GETOPT_H)
    check_symbol_exists (getopt "unistd.h;getopt.h" HAVE_GETOPT)
endif ()
if (HAVE_UNISTD_H)
    check_symbol_exists (getpagesize "unistd.h" HAVE_GETPAGESIZE)
    check_symbol_exists (getpid "unistd.h" HAVE_GETPID)
endif ()
if (HAVE_SYS_TYPES_H OR HAVE_PWD_H)
    check_symbol_exists (getpwnam "sys/types.h;pwd.h" HAVE_GETPWNAM)
endif ()
if (HAVE_SYS_TIME_H)
    check_symbol_exists (gettimeofday "sys/time.h" HAVE_GETTIMEOFDAY)
endif ()
if (HAVE_SYS_PARAM_H OR HAVE_SYS_UCRED_H OR HAVE_SYS_MOUNT_H)
    check_symbol_exists (getvfsstat "sys/param.h;sys/ucred.h;sys/mount.h" HAVE_GETVFSSTAT)
endif ()
if (HAVE_STDIO_H OR HAVE_MNTENT_H)
    check_symbol_exists (hasmntopt "stdio.h;mntent.h" HAVE_HASMNTOPT)
endif ()
if (HAVE_NET_IF_H)
    check_symbol_exists (if_freenameindex "net/if.h" HAVE_IF_FREENAMEINDEX)
    check_symbol_exists (if_indextoname "net/if.h" HAVE_IF_INDEXTONAME)
    check_symbol_exists (if_nameindex "net/if.h" HAVE_IF_NAMEINDEX)
    check_symbol_exists (if_nametoindex "net/if.h" HAVE_IF_NAMETOINDEX)
endif ()
if (HAVE_ARPA_INET_H)
    check_symbol_exists (inet_ntop "arpa/inet.h" HAVE_INET_NTOP)
    check_symbol_exists (inet_pton "arpa/inet.h" HAVE_INET_PTON)
endif ()
if (HAVE_SYS_TYPES_H OR HAVE_GRP_H)
    check_symbol_exists (initgroups "sys/types.h;grp.h" HAVE_INITGROUPS)
endif ()
if (HAVE_SYS_SOCKET_H OR HAVE_NETINET_IN_H OR HAVE_NETINET_IP_H)
    check_symbol_exists (IP_PKTINFO "sys/socket.h;netinet/in.h;netinet/ip.h" HAVE_IP_PKTINFO)
endif ()
if (HAVE_SYS_TYPES_H OR HAVE_SYS_SOCKET_H OR HAVE_NETINET_IN_H)
    check_symbol_exists (IP_RECVDSTADDR "sys/types.h;sys/socket.h;netinet/in.h" HAVE_IP_RECVDSTADDR)
endif ()
if (HAVE_TIME_H)
    check_symbol_exists (localtime_r "time.h" HAVE_LOCALTIME_R)
endif ()
if (HAVE_STDLIB_H)
    check_symbol_exists (lrand48 "stdlib.h" HAVE_LRAND48)
endif ()
if (HAVE_SYS_TYPES_H OR HAVE_UNISTD_H)
    check_symbol_exists (lseek64 "sys/types.h;unistd.h" HAVE_LSEEK64)
endif ()
if (HAVE_STDLIB_H)
    check_symbol_exists (mkstemp "stdlib.h" HAVE_MKSTEMP)
endif ()
if (HAVE_TIME_H)
    check_symbol_exists (mktime "time.h" HAVE_MKTIME)
endif ()
if (HAVE_POLL_H)
    check_symbol_exists (nfds_t "poll.h" HAVE_NFDS_T)
endif ()
if (HAVE_DIRENT_H)
    check_symbol_exists (opendir "dirent.h" HAVE_OPENDIR)
endif ()
if (HAVE_POLL_H)
    check_symbol_exists (poll "poll.h" HAVE_POLL)
endif ()
if (HAVE_UNISTD_H)
    check_symbol_exists (pread64 "unistd.h" HAVE_PREAD64)
endif ()
if (HAVE_STDLIB_H)
    check_symbol_exists (rand "stdlib.h" HAVE_RAND)
    check_symbol_exists (random "stdlib.h" HAVE_RANDOM)
endif ()
if (HAVE_DIRENT_H)
    check_symbol_exists (readdir "dirent.h" HAVE_READDIR)
endif ()
if (HAVE_REGEX_H)
    check_symbol_exists (regcomp "regex.h" HAVE_REGCOMP)
endif ()
if (HAVE_SYS_SELECT_H)
    check_symbol_exists (select "sys/select.h" HAVE_SELECT)
endif ()
if (HAVE_SENSORS_SENSORS_H)
    check_symbol_exists (sensors_get_all_subfeatures "sensors/sensors.h" HAVE_DECL_SENSORS_GET_ALL_SUBFEATURES)
endif ()
if (HAVE_STDLIB_H)
    check_symbol_exists (setenv "stdlib.h" HAVE_SETENV)
endif ()
if (HAVE_UNISTD_H)
    check_symbol_exists (setgid "unistd.h" HAVE_SETGID)
endif ()
if (HAVE_SYS_TYPES_H OR HAVE_UNISTD_H)
    check_symbol_exists (setgroups "sys/types.h;unistd.h" HAVE_SETGROUPS)
endif ()
if (HAVE_SYS_TIME_H)
    check_symbol_exists (setitimer "sys/time.h" HAVE_SETITIMER)
endif ()
if (HAVE_LOCALE_H)
    check_symbol_exists (setlocale "locale.h" HAVE_SETLOCALE)
endif ()
if (HAVE_STDIO_H OR HAVE_MNTENT_H)
    check_symbol_exists (setmntent "stdio.h;mntent.h" HAVE_SETMNTENT)
endif ()
if (HAVE_UNISTD_H)
    check_symbol_exists (setsid "unistd.h" HAVE_SETSID)
    check_symbol_exists (setuid "unistd.h" HAVE_SETUID)
endif ()
if (HAVE_SIGNAL_H)
    check_symbol_exists (sigaction "signal.h" HAVE_SIGACTION)
endif ()
if (HAVE_UNISTD_H)
    check_symbol_exists (sigalrm "unistd.h" HAVE_SIGALRM)
endif ()
if (HAVE_SIGNAL_H)
    check_symbol_exists (sigblock "signal.h" HAVE_SIGBLOCK)
    check_symbol_exists (sighold "signal.h" HAVE_SIGHOLD)
    check_symbol_exists (SIGHUP "signal.h" HAVE_SIGHUP)
    check_symbol_exists (signal "signal.h" HAVE_SIGNAL)
    check_symbol_exists (sigprocmask "signal.h" HAVE_SIGPROCMASK)
    check_symbol_exists (sigset "signal.h" HAVE_SIGSET)
endif ()
if (HAVE_STDIO_H)
    check_symbol_exists (snprintf "stdio.h" HAVE_SNPRINTF)
endif ()
if (HAVE_SYS_SOCKET_H)
    check_symbol_exists (socket "sys/socket.h" HAVE_SOCKET)
endif ()
if (HAVE_STDLIB_H)
    check_symbol_exists (srand "stdlib.h" HAVE_SRAND)
    check_symbol_exists (srandom "stdlib.h" HAVE_SRANDOM)
    check_symbol_exists (srand48 "stdlib.h" HAVE_SRAND48)
endif ()
if (HAVE_SYS_VFS_H OR HAVE_SYS_STATFS_H)
    check_symbol_exists (statfs "sys/vfs.h;sys/statfs.h" HAVE_STATFS)
endif ()
if (HAVE_SYS_STATVFS_H)
    check_symbol_exists (statvfs "sys/statvfs.h" HAVE_STATVFS)
endif ()
if (HAVE_TIME_H)
    check_symbol_exists (stime "time.h" HAVE_STIME)
endif ()
if (HAVE_STRING_H)
    check_symbol_exists (strcasestr "string.h" HAVE_STRCASESTR)
endif ()
if (HAVE_BSD_STRING_H)
    check_symbol_exists (strlcat "bsd/string.h" HAVE_STRLCAT)
    check_symbol_exists (strlcpy "bsd/string.h" HAVE_STRLCPY)
endif ()
if (HAVE_STRING_H)
    check_symbol_exists (strdup "string.h" HAVE_STRDUP)
    check_symbol_exists (strerror "string.h" HAVE_STRERROR)
    check_symbol_exists (strncasecmp "string.h" HAVE_STRNCASECMP)
    check_symbol_exists (strtok_r "string.h" HAVE_STRTOK_R)
endif ()
if (HAVE_STDLIB_H)
    check_symbol_exists (strtol "stdlib.h" HAVE_STRTOL)
    check_symbol_exists (strtoul "stdlib.h" HAVE_STRTOUL)
    check_symbol_exists (strtoull "stdlib.h" HAVE_STRTOULL)
endif ()
if (HAVE_UNISTD_H)
    check_symbol_exists (sysconf "unistd.h" HAVE_SYSCONF)
endif ()
if (HAVE_STDLIB_H)
    check_symbol_exists (system "stdlib.h" HAVE_SYSTEM)
endif ()
if (HAVE_TERMIOS_H OR HAVE_UNISTD_H)
    check_symbol_exists (tcgetattr "termios.h;unistd.h" HAVE_TCGETATTR)
endif ()
if (HAVE_SYS_TIMES_H)
    check_symbol_exists (times "sys/times.h" HAVE_TIMES)
endif ()
if (HAVE_SYS_UTSNAME_H)
    check_symbol_exists (uname "sys/utsname.h" HAVE_UNAME)
endif ()
if (HAVE_UNISTD_H)
    check_symbol_exists (usleep "unistd.h" HAVE_USLEEP)
endif ()
if (HAVE_STDIO_H)
    check_symbol_exists (vsnprintf "stdio.h" HAVE_VSNPRINTF)
endif ()

include (CheckStructHasMember)
if (HAVE_DIRENT_H)
    check_struct_has_member ("struct dirent" d_type "dirent.h" HAVE_STRUCT_DIRENT_D_TYPE)
endif ()
if (HAVE_LINUX_ETHTOOL_H)
    check_struct_has_member ("struct ethtool_cmd" speed_hi "linux/ethtool.h" HAVE_STRUCT_ETHTOOL_CMD_SPEED_HI)
endif ()
check_struct_has_member ("struct ifaddr" ifa_next "sys/types.h;ifaddrs.h" HAVE_STRUCT_IFADDR_IFA_NEXT)
if (HAVE_BSD_NLIST_H)
    check_struct_has_member ("struct nlist" n_value "bsd/nlist.h" HAVE_STRUCT_NLIST_N_VALUE)
endif ()
if (HAVE_SYS_SOCKET_H OR HAVE_NET_ROUTE_H)
    check_struct_has_member ("struct rtentry" rt_dst "sys/socket.h;net/route.h" HAVE_STRUCT_RTENTRY_RT_DST)
    check_struct_has_member ("struct rtentry" rt_hash "sys/socket.h;net/route.h" HAVE_STRUCT_RTENTRY_RT_HASH)
    check_struct_has_member ("struct rtentry" rt_next "sys/socket.h;net/route.h" HAVE_STRUCT_RTENTRY_RT_NEXT)
    check_struct_has_member ("struct rtentry" rt_refcnt "sys/socket.h;net/route.h" HAVE_STRUCT_RTENTRY_RT_REFCNT)
    check_struct_has_member ("struct rtentry" rt_unit "sys/socket.h;net/route.h" HAVE_STRUCT_RTENTRY_RT_UNIT)
    check_struct_has_member ("struct rtentry" rt_use "sys/socket.h;net/route.h" HAVE_STRUCT_RTENTRY_RT_USE)
endif ()
if (HAVE_SIGNAL_H)
    check_struct_has_member ("struct sigaction" sa_sigaction "signal.h" HAVE_STRUCT_SIGACTION_SA_SIGACTION)
endif ()
check_struct_has_member ("struct sockaddr_in6" sin6_scope_id "sys/socket.h;netinet/in.h" HAVE_STRUCT_SOCKADDR_IN6_SIN6_SCOPE_ID)
if (HAVE_SYS_SOCKET_H)
    check_struct_has_member ("struct sockaddr" sa_len "sys/socket.h" HAVE_STRUCT_SOCKADDR_SA_LEN)
    check_struct_has_member ("struct sockaddr" sa_union.sa_generic.sa_family2 "sys/socket.h" HAVE_STRUCT_SOCKADDR_SA_UNION_SA_GENERIC_SA_FAMILY2)
endif ()
if (HAVE_SYS_VFS_H OR HAVE_SYS_STATFS_H)
    check_struct_has_member ("struct statfs" f_favail "sys/vfs.h;sys/statfs.h" HAVE_STRUCT_STATFS_F_FAVAIL)
    check_struct_has_member ("struct statfs" f_ffree "sys/vfs.h;sys/statfs.h" HAVE_STRUCT_STATFS_F_FFREE)
    check_struct_has_member ("struct statfs" f_files "sys/vfs.h;sys/statfs.h" HAVE_STRUCT_STATFS_F_FILES)
    check_struct_has_member ("struct statfs" f_flags "sys/vfs.h;sys/statfs.h" HAVE_STRUCT_STATFS_F_FLAGS)
    check_struct_has_member ("struct statfs" f_frsize "sys/vfs.h;sys/statfs.h" HAVE_STRUCT_STATFS_F_FRSIZE)
endif ()

check_by_try_compile(HAVE_IN_ADDR_T)
check_by_try_compile(TIME_WITH_SYS_TIME)
