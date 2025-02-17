#ifndef KASYNC_CONFIG_INCLUDED_H
#define KASYNC_CONFIG_INCLUDED_H
#define KSOCKET_SSL 1
#define KSOCKET_SSL_BIO 1
/* #undef WOLFSSL_SSL */
/* #undef LINUX */
/* #undef LINUX_IOURING */
/* #undef HAVE_ACCEPT4 */
/* #undef KASYNC_TEST */
/* #undef HAVE_MEMALIGN */
/* #undef HAVE_SETMNTENT */
/* #undef DISABLE_KFIBER */
/* #undef FREEBSD */
/* #undef DARWIN */
#ifdef WOLFSSL_SSL




#define BIO_get_init(x) (x->init)
#endif
#ifndef NDEBUG
/* #undef MALLOCDEBUG */
#endif
/* #undef ENABLE_LIBUCONTEXT */
#ifdef HAVE_ACCEPT4
#undef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#endif