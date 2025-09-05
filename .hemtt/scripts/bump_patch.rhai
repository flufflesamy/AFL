// Read the current contents of script_version.hpp
let script_version = HEMTT_RFS.join("addons")
    .join("main")
    .join("script_version.hpp")
    .open_file()
    .read();

// Replace the current version with the new version
let prefix = "#define PATCH ";
let build = "#define BUILD ";
let current_build = HEMTT.project().version().build();
let current = HEMTT.project().version().patch();
let next = current + 1;

script_version.replace(prefix + current.to_string(), prefix + next.to_string());
script_version.replace(build + current_build.to_string(), build + "0");

// Write the modified contents to script_version.hpp
HEMTT_RFS.join("addons")
    .join("main")
    .join("script_version.hpp")
    .create_file()
    .write(script_version);
