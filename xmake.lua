

add_requires("wolfssl",{system = false,configs ={userset = true}})


add_requires("openssl","gtest")

target("kasync")
 set_kind("static")
 add_files("./src/*.c")
 add_includedirs("./include/")
 add_packages("wolfssl")
 add_syslinks("ws2_32","advapi32")
 set_configvar("KSOCKET_SSL",1) --开启ssl
 set_configvar("KSOCKET_SSL_BIO",1) --开启ssl的bio
 set_configvar("WOLFSSL_SSL",1) --开启wolfssl的openssl兼容
 set_configdir("./include/")
 add_configfiles("./kasync_config.h.in")


target("example")
 set_kind("binary")
 add_packages("wolfssl")
 add_syslinks("ws2_32","advapi32")
 add_includedirs("./include/")
 add_files("./src/*.c")
 add_files("./example/pingpang.c")


target("test")
 set_kind("binary")
 add_packages("wolfssl","gtest")
 add_syslinks("ws2_32","advapi32")
 add_includedirs("./include/")
 add_includedirs("./test/")
 add_files("./src/*.c")
 add_files("./test/*.cc")
 add_files("./test/kfiter_test/*.cc")
