#ifndef KASYNC_CONFIG_INCLUDED_H
#define KASYNC_CONFIG_INCLUDED_H
#define KSOCKET_SSL 1
#define KSOCKET_SSL_BIO 1
#define WOLFSSL_SSL 1
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

#define OPENSSL_EXTRA 1
#define WOLFSSL_ALWAYS_VERIFY_CB 1
#define WOLFSSL_VERIFY_CB_ALL_CERTS 1
#define WOLFSSL_EXTRA_ALERTS 1
#define HAVE_EXT_CACHE 1
#define WOLFSSL_FORCE_CACHE_ON_TICKET 1

#define SSL_READ_EARLY_DATA_ERROR   0
#define SSL_READ_EARLY_DATA_SUCCESS 1
#define SSL_READ_EARLY_DATA_FINISH  2
#define SSL_CTRL_SET_TLSEXT_HOSTNAME	55
#define WOLFSSL_SNI_HOST_NAME	0

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