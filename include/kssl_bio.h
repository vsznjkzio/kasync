#ifndef KSSL_BIO_H_99
#define KSSL_BIO_H_99
#include "kfeature.h"
#ifdef ENABLE_KSSL_BIO
#include "kselector.h"
#ifdef WOLFSSL_SSL
#include <wolfssl/options.h>
#include <wolfssl/openssl/ssl.h>

#include <wolfssl/openssl/bio.h>

#else
#include <openssl/bio.h>

#endif
KBEGIN_DECLS
typedef struct {
	BIO *bio;
	buffer_callback buffer;
	result_callback result;
	kselectable *st;
	void *arg;
	int got;
} kssl_bio;

void kgl_bio_init_method();
BIO_METHOD *BIO_kgl_method();
kev_result result_ssl_bio_read(KOPAQUE data, void *arg, int got);
int  buffer_ssl_bio_read(KOPAQUE data, void *arg, LPWSABUF buf, int bufCount);
kev_result result_ssl_bio_write(KOPAQUE data, void *arg, int got);
int  buffer_ssl_bio_write(KOPAQUE data, void *arg, LPWSABUF buf, int bufCount);
KEND_DECLS
#endif
#endif

