#!/bin/bash

# Lab 1 script updated for lab 3
echo "SPR500 Lab 3 Report"
echo "Full name: Viet Anh Nguyen"
echo "User name: vanguyen8"
echo "Student ID: 151939188"
echo " "

# Routing table on VM2
echo "VM2 routing table:"
ip route
echo " "

#http server is running on port 80
echo "http server port 80"
systemctl status httpd | grep -F "listening"
echo " "

# Current size of log files
echo "Current size of log files:"
pushd /var/log
ls -l messages boot.log maillog secure wtmp btmp lastlog dnf.log
popd
echo " "

#Num active services on VM2
echo "Number of active services on VM2:"
systemctl list-unit-files | grep enabled | wc -l
echo " "

#Current firewall rules
echo "Current firewall rules:"
iptables -L -n -v
echo " "

#Sestatus
echo "Sestatus:"
sestatus
echo " "

#Bash script that does lab 1's task including

#(a) Hostname
echo "Hostname:" $'\n' $(hostname)

#(b) disk/partition size, usage, and mount points
#this command gets disk, partition names, size in 1M blocks, used, available, use% and mount point
disk_info=$(df -BM | grep -F "/dev/sda")
headline=$(df -BM | head -1)
echo "disk/partition size, usage, and mountpoints" $'\n' "$headline" $'\n' "$disk_info"

#c) network devices (name)
echo "Network devices (name):"
ip a | grep -F "state" | cut -d ' ' -f 2 | tr -d ':'
echo " "

#(d) IP address, broadcast, and netmask for each active device
# this command currently prints all IP addresses, netmasks for active devices. Address and netmask are unseparated
# if use grep -F " inet" will show both v4 and v6 interfaces
echo "IP address, broadcast, and netmask for each active device:"
ip a 
#this command also prints broadcast address for active IPv4 interfaces
echo " "

#(e) OS version/release level, kernel version used
#this command shows OS version
echo "OS version/release level:"
cat /etc/os-release | grep -w  "PRETTY_NAME"
#this command shows Linux kernel version
echo "Kernel version:"
uname -r
echo " "

#(f) security mode (SELinux status)
echo "Security/SELinux status:" 
sestatus | head -1

#(g) firewall configuration
#user either firewall-cmd or iptables ( in this scenario we disabled firewalld)
echo "Firewall configuration" 
iptables -L
echo " "

#(h) list of active repositories
echo "list of active repositories" 
yum repolist
echo " "

#(i) number of software packages (rpm, deb, etc) installed
echo "number of software packages:" 
yum list installed | wc -l
echo " "

#(j) name of software packages installed
echo "name of software packages installed:" $'\n'
yum list installed 
echo " "

#k) dns server configured (which dns server(s) will be used for the local resolver)
echo "dns server configured:" 
cat /etc/resolv.conf | grep -F "nameserver"
echo " "

#(l) list of active shell users
echo "list of active shell users:"
w
echo " "

#(m) date the os was first installed
echo "date the os was first installed:"
rpm -qi setup | grep -F " Install Date"
echo " "

#(n) hardware details: cpu, main memory size, swap memory configure, devices, etc
#cpu:
echo "cpu details:"
lscpu
echo " "

#main memory size, swap memory config:
echo "memory details:"
free
echo " "

#devices:
echo "devices:"
echo "SCSI"
lsscsi
echo " "

echo "Block devices"
lsblk
echo " "
#(o) services current running
echo "services current running:"
systemctl --type=service --state=running
echo " "

#(p) services installed but not running
echo "services installed but not running:"
systemctl --type=service --state=inactive
echo " "

#(q) any other information/data you think that is important and necessary to have.
