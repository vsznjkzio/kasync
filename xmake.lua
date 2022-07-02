
add_requires("wolfssl")

target("kasync")
if is_plat("windows") then
    set_kind("static")
    add_files("include/*.h")
    add_files("src/*.c")
    add_packages("wolfssl")
    add_syslinks("wsock32", "ws2_32")
    add_configfiles("/include/kasync_config.h.in");
end

