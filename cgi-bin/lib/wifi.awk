/ESSID/ {
    mac = gensub ( /ESSID[[:space:]]*([0-9a-fA-F:]+).*?$/, "\\1", "g", $0 );
}
/^[[:space:]]*signal:/ {
    signal = gensub ( /^[[:space:]]*signal:[[:space:]]*(\-?[0-9.]+).*?$/, "\\1", "g", $0 );
}
/^[[:space:]]*SSID:/ {
    ssid = gensub ( /^[[:space:]]*SSID:[[:space:]]*([^\n]*).*?$/, "\\1", "g", $0 );
    printf ( "%s %s %s\n", signal, mac, ssid );
}