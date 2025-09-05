if HEMTT.is_release() {
    let config = HEMTT_VFS
            .join("addons")
            .join("main")
            .join("script_mod.hpp")
            .open_file().read(); // Read the contents of script_mod.cpp
    config.replace("#define DEBUG_MODE_FULL", ""); // Comment debug mode define
    HEMTT_VFS
            .join("addons")
            .join("main")
            .join("script_mod.hpp")
            .create_file()
            .write(config); // Write the new contents over the old contents
}
