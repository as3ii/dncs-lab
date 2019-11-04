#!/bin/sh

# send 4 ICMP packet to check reachability
check() {
    printf "checking %*s: " -22 "${1}"
    ping -4 -c 4 -i 0.5 -q -w 0.5 "${1}" > /dev/null && return 0 || return 1
}

OK="\033[0;32m  OK  \033[0m"
FAILED="\033[0;31mFAILED\033[0m"

check "10.0.0.1" && printf "[$OK]\n" || printf "[$FAILED]\n"
check "10.0.0.2" && printf "[$OK]\n" || printf "[$FAILED]\n"
check "10.0.2.1" && printf "[$OK]\n" || printf "[$FAILED]\n"
# 10.0.4.0/23 should not be reachable from subnets different from 10.0.0.0/23
check "10.0.4.1" && printf "[$FAILED]\n" || printf "[$OK]\n"
check "10.0.4.2" && printf "[$FAILED]\n" || printf "[$OK]\n"

# check if host-c web server work
printf "checking web server on 10.0.0.2: "
if [ "$(curl -sL -m 2 -w "%{http_code}\\n" 10.0.0.2 -o /dev/null)" = "200" ]
then
    printf "[$OK]\n"
else
    printf "[$FAILED]\n"
fi

