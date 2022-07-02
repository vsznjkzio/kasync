
add_requires("wolfssl")

target("kasync")
if is_plat("windows") then
    set_kind("static")
    add_files("./src/*.c")
    add_files("./include/*.h")
    add_packages("wolfssl")
    add_syslinks("ws2_32")
    set_configvar("KSOCKET_SSL",1) --开启ssl
    set_configvar("KSOCKET_SSL_BIO",1) --开启ssl的bio
    set_configdir("./include/")
    add_configfiles("./kasync_config.h.in")
end

