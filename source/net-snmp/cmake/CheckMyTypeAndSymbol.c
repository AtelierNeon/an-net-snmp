#ifdef TIME_WITH_SYS_TIME
/* Time with sys/time test */

#include <sys/types.h>
#include <sys/time.h>
#include <time.h>

int
main()
{
  if ((struct tm *) 0)
    return 0;
  ;
  return 0;
}
#endif

#ifdef HAVE_IN_ADDR_T
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>

int
main()
{
  if ((in_addr_t *) 0)
    return 0;
  if (sizeof (in_addr_t))
    return 0;
  ;
  return 0;
}
#endif

#ifdef HAVE_IP_PKTINFO
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int
main ()
{

    void *buf;
    int len;
    void *from;
    socklen_t *fromlen;

    struct iovec iov;
    char *cmsg = malloc(CMSG_SPACE(sizeof(struct in_pktinfo)));
    struct cmsghdr *cm;
    struct msghdr msg;

    iov.iov_base = buf;
    iov.iov_len = len;

    memset(&msg, 0, sizeof msg);
    msg.msg_name = from;
    msg.msg_namelen = *fromlen;
    msg.msg_iov = &iov;
    msg.msg_iovlen = 1;
    msg.msg_control = &cmsg;
    msg.msg_controllen = sizeof(cmsg);

    for (cm = CMSG_FIRSTHDR(&msg); cm; cm = CMSG_NXTHDR(&msg, cm)) {
        if (cm->cmsg_level == SOL_IP && cm->cmsg_type == IP_PKTINFO) {
            struct in_pktinfo* src = (struct in_pktinfo *)CMSG_DATA(cm);
            printf("Address: %s; index: %d\n", inet_ntoa(src->ipi_addr),
	           src->ipi_ifindex);
        }
    }

  ;
  return 0;
}
#endif
