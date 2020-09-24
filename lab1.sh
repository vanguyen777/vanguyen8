#!/bin/bash

#Bash script that does lab 1's task including

#(a) Hostname
cat /etc/hostname

#(b) disk/partition size, usage, and mount points
#this command gets disk, partition mount point
mount | grep -F "/dev/sda"


#c) network devices (name)
ip a | grep -F "state" | cut -d ' ' -f 2 | tr -d ':'

#(d) IP address, broadcast, and netmask for each active device
# this command currently prints all IP addresses, netmasks for active devices. Address and netmask are unseparated
ip a | grep -F "inet" | cut -d ' ' -f 6

#(e) OS version/release level, kernel version used

#(f) security mode (SELinux status)

sestatus | head -1
#(g) firewall configuration

#(h) list of active repositories

#(i) number of software packages (rpm, deb, etc) installed

#(j) name of software packages installed

#k) dns server configured (which dns server(s) will be used for the local resolver)

#(l) list of active shell users

#(m) date the os was first installed

#(n) hardware details: cpu, main memory size, swap memory configure, devices, etc

#(o) services current running

#(p) services installed but not running

#(q) any other information/data you think that is important and necessary to have.
