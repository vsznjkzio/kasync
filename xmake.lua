
add_requires("openssl","gtest")

target("kasync")
 set_kind("static")
 add_files("./src/*.c")
 add_includedirs("./include/")
 add_packages("openssl")
 add_syslinks("ws2_32","advapi32")
 set_configvar("KSOCKET_SSL",1) --开启ssl
 set_configvar("KSOCKET_SSL_BIO",1) --开启ssl的bio
 set_configdir("./include/")
 add_configfiles("./kasync_config.h.in")


target("example")
 set_kind("binary")
 add_packages("openssl")
 add_syslinks("ws2_32","advapi32")
 add_includedirs("./include/")
 add_files("./src/*.c")
 add_files("./example/pingpang.c")


target("test")
 set_kind("binary")
 add_packages("openssl","gtest")
 add_syslinks("ws2_32","advapi32")
 add_includedirs("./include/")
 add_includedirs("./test/")
 add_files("./src/*.c")
 add_files("./test/*.cc")
 add_files("./test/kfiter_test/*.cc")


target("libasync")
 set_kind("shared")
 add_packages("openssl")
 add_syslinks("ws2_32","advapi32")
 add_includedirs("./include/")
 add_files("./src/*.c")
--todo::导出函数