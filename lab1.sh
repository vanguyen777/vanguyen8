#!/bin/bash

#Bash script that does lab 1's task including

#(a) Hostname
echo "Hostname:" $(hostname)

#(b) disk/partition size, usage, and mount points
#this command gets disk, partition names, size in 1M blocks, used, available, use% and mount point
disk_info=$(df -BM | grep -F "/dev/sda")
headline=$(df -BM | head -1)
echo "$headline" $'\n' "$disk_info"

#c) network devices (name)
ip a | grep -F "state" | cut -d ' ' -f 2 | tr -d ':'

#(d) IP address, broadcast, and netmask for each active device
# this command currently prints all IP addresses, netmasks for active devices. Address and netmask are unseparated
# if use grep -F " inet" will show both v4 and v6 interfaces
ip a | grep -w "inet" | cut -d ' ' -f 6-8 | grep "brd"
#this command also prints broadcast address for active IPv4 interfaces

#(e) OS version/release level, kernel version used
#this command shows OS version
cat /etc/os-release | grep -w  "PRETTY_NAME"
#this command shows Linux kernel version
uname -r

#(f) security mode (SELinux status)
sestatus | head -1

#(g) firewall configuration
#user either firewall-cmd or iptables

#(h) list of active repositories
yum repolist

#(i) number of software packages (rpm, deb, etc) installed
yum list installed | wc -l

#(j) name of software packages installed
yum list installed 

#k) dns server configured (which dns server(s) will be used for the local resolver)
cat /etc/resolv.conf | grep -F "nameserver"

#(l) list of active shell users
w

#(m) date the os was first installed
rpm -qi setup | grep -F " Install Date"

#(n) hardware details: cpu, main memory size, swap memory configure, devices, etc
#cpu:
lscpu
#main memory size, swap memory config:
free
#devices:
lspci

#(o) services current running
systemctl --type=service --state=running

#(p) services installed but not running
systemctl --type=service --state=exited

#(q) any other information/data you think that is important and necessary to have.
