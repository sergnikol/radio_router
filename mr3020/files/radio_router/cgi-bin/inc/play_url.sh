#/usr/bin/wget -q -O - "$URL" | /usr/bin/madplay - -Q --no-tty-control > /dev/null 2>&1&
#http://77.93.201.243/GYM2
/usr/bin/wget-nossl --waitretry=5 --timeout=15  -t 1 -q -O - "$URL" | /usr/bin/madplay - -Q --no-tty-control &
#/usr/bin/wget-nossl --waitretry=5 --timeout=15  -t 1 -q -O - "http://77.93.201.243/GYM2" | /usr/bin/madplay - -Q --no-tty-control &
