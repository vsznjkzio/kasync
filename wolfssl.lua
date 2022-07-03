package("wolfssl")
    set_homepage("https://www.wolfssl.com")
    set_description("The wolfSSL library is a small, fast, portable implementation of TLS/SSL for embedded devices to the cloud.  wolfSSL supports up to TLS 1.3!")
    set_license("GPL-2.0")

    add_urls("https://github.com/wolfSSL/wolfssl/archive/refs/tags/$(version).tar.gz",
             "https://github.com/wolfSSL/wolfssl.git")
    add_versions("v5.3.0-stable", "1a3bb310dc01d3e73d9ad91b6ea8249d081016f8eef4ae8f21d3421f91ef1de9")

    add_configs("userset", {description = "WOLFSSL_USER_SETTINGS", default = false, type = "boolean"})
    add_configs("openssl_extra", {description = "WOLFSSL_OPENSSLEXTRA", default = false, type = "boolean"})
    add_configs("dh_default_params", {description = "WOLFSSL_DH_DEFAULT_PARAMS", default = false, type = "boolean"})
    add_configs("pkcs12", {description = "Enable pkcs12", default = false, type = "boolean"})
    add_configs("enckeys", {description = "Enable PEM encrypted key support", default = false, type = "boolean"})
    add_configs("tlsx", {description = "Enable all TLS Extensions", default = false, type = "boolean"})
    add_configs("sni", {description = "Enable SNI", default = false, type = "boolean"})

    add_configs("md4", {description = "Enable MD4", default = false, type = "boolean"})
    add_configs("tests", {description = "Generate test", default = false, type = "boolean"})
    add_configs("examples", {description = "Generate examples", default = false, type = "boolean"})

    add_deps("cmake")

    on_install(function (package)
        local configs = {}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
        table.insert(configs, "-DWOLFSSL_OPENSSLEXTRA=" .. (package:config("openssl_extra") and "yes" or "no"))
        table.insert(configs, "-DWOLFSSL_DH_DEFAULT_PARAMS=" .. (package:config("dh_default_params") and "yes" or "no"))
        table.insert(configs, "-DWOLFSSL_PKCS12=" .. (package:config("pkcs12") and "yes" or "no"))
        table.insert(configs, "-DWOLFSSL_ENCKEYS=" .. (package:config("enckeys") and "yes" or "no"))
        table.insert(configs, "-DWOLFSSL_MD4=" .. (package:config("md4") and "yes" or "no"))
        table.insert(configs, "-DWOLFSSL_TLSX=" .. (package:config("tlsx") and "yes" or "no"))
        table.insert(configs, "-DWOLFSSL_SNI=" .. (package:config("sni") and "yes" or "no"))
        table.insert(configs, "-DWOLFSSL_USER_SETTINGS=" .. (package:config("userset") and "yes" or "no"))
        table.insert(configs, "-DWOLFSSL_CRYPT_TESTS=".. (package:config("tests") and "yes" or "no"))
        table.insert(configs, "-DWOLFSSL_EXAMPLES=".. (package:config("examples") and "yes" or "no"))
        

        local ldflags
        if package:is_plat("android") then
            ldflags = "-llog"
        end
        import("package.tools.cmake").install(package, configs, {ldflags = ldflags})
    end)

    on_test(function (package)
        assert(package:has_cincludes("wolfssl/ssl.h"))
    end)
