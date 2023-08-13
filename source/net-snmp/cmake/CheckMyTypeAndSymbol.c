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
