#!/bin/bash

#Bash script that does lab 1's task including

#(a) Hostname
echo "Hostname:" $'\n' $(hostname)

#(b) disk/partition size, usage, and mount points
#this command gets disk, partition names, size in 1M blocks, used, available, use% and mount point
disk_info=$(df -BM | grep -F "/dev/sda")
headline=$(df -BM | head -1)
echo "disk/partition size, usage, and mountpoints" $'\n' "$headline" $'\n' "$disk_info"

#c) network devices (name)
echo "Network devices (name):" $'\n'
ip a | grep -F "state" | cut -d ' ' -f 2 | tr -d ':'

#(d) IP address, broadcast, and netmask for each active device
# this command currently prints all IP addresses, netmasks for active devices. Address and netmask are unseparated
# if use grep -F " inet" will show both v4 and v6 interfaces
echo "IP address, broadcast, and netmask for each active device:" $'\n'
ip a 
#this command also prints broadcast address for active IPv4 interfaces

#(e) OS version/release level, kernel version used
#this command shows OS version
echo "OS version/release level:" $'\n'
cat /etc/os-release | grep -w  "PRETTY_NAME"
#this command shows Linux kernel version
echo "Kernel version:" $'\n'
uname -r

#(f) security mode (SELinux status)
echo "Security/SELinux status:" $'\n'
sestatus | head -1

#(g) firewall configuration
#user either firewall-cmd or iptables
echo "Firewall configuration" $'\n'
firewall-cmd --list-all

#(h) list of active repositories
echo "list of active repositories" $'\n'
yum repolist

#(i) number of software packages (rpm, deb, etc) installed
echo "number of software packages:" $'\n'
yum list installed | wc -l

#(j) name of software packages installed
echo "name of software packages installed:" $'\n'
yum list installed 

#k) dns server configured (which dns server(s) will be used for the local resolver)
echo "dns server configured:" $'\n'
cat /etc/resolv.conf | grep -F "nameserver"

#(l) list of active shell users
echo "list of active shell users:" $'\n'
w

#(m) date the os was first installed
echo "date the os was first installed:" $'\n'
rpm -qi setup | grep -F " Install Date"

#(n) hardware details: cpu, main memory size, swap memory configure, devices, etc
#cpu:
echo "cpu details:" $'\n'
lscpu
#main memory size, swap memory config:
echo "memory details:" $'\n'
free
#devices:
echo "devices:" $'\n'
lspci

#(o) services current running
echo "services current running:" $'\n'
systemctl --type=service --state=running

#(p) services installed but not running
echo "services installed but not running:" $'\n'
systemctl --type=service --state=inactive

#(q) any other information/data you think that is important and necessary to have.
