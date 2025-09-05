let releases = HEMTT_RFS.join("releases");

let src = releases.join(HEMTT.project().prefix() + "-latest.zip"); // "prefix-latest.zip"
let dst = releases.join(HEMTT.project().prefix() + "-" + HEMTT.project().version().to_string_short() + ".zip");

if src.is_file() { // support --no-archive
    print("Moving zip to " + dst);
    if !src.move(dst) {
        fatal("Failed to move " + src + " to " + dst);
    }
}
