// Read the current contents of script_version.hpp
let script_version = HEMTT_RFS.join("addons")
    .join("main")
    .join("script_version.hpp")
    .open_file()
    .read();

// Replace the current version with the new version
let prefix = "#define MAJOR ";
let current = HEMTT.project().version().major();
let next = current + 1;
let build = "#define BUILD ";
let current_build = HEMTT.project().version().build();
let patch = "#define PATCH ";
let current_patch = HEMTT.project().version().patch();
let minor = "#define MINOR ";
let current_minor = HEMTT.project().version().minor();

script_version.replace(prefix + current.to_string(), prefix + next.to_string());
script_version.replace(build + current_build.to_string(), build + "0");
script_version.replace(patch + current_patch.to_string(), patch + "0");
script_version.replace(minor + current_minor.to_string(), minor + "0");

// Write the modified contents to script_version.hpp
HEMTT_RFS.join("addons")
    .join("main")
    .join("script_version.hpp")
    .create_file()
    .write(script_version);
