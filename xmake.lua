



add_requires("openssl")

target("kasync")
if is_plat("windows") then
    set_kind("static")
    add_files("./src/*.c")
    add_includedirs("./include/")
    add_packages("openssl")

    add_syslinks("ws2_32","advapi32")
    set_configvar("KSOCKET_SSL",1) --开启ssl
    set_configvar("KSOCKET_SSL_BIO",1) --开启ssl的bio
    --set_configvar("WOLFSSL_SSL",1) --开启wolfssl的bio
    --set_configvar("OPENSSL_EXTRA",1) --开启wolfssl的OPENSSL 兼容



    set_configdir("./include/")
    add_configfiles("./kasync_config.h.in")
end

target("example")
 set_kind("binary")

 add_packages("openssl")
 add_syslinks("ws2_32","advapi32")

 add_includedirs("./include/")
 add_files("./src/*.c")
 add_files("./example/pingpang.c")
