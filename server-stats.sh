#!/bin/bash

# This script collects server performance stats and outputs them in a readable format.

# Function to get CPU stats
get_cpu_stats() {
    echo "CPU Usage:"
    mpstat | grep -i 'all' | awk '{print "User CPU: " $3 "% | System CPU: " $5 "% | Idle CPU: " $12 "%"}'
    echo
}

# Function to get Memory stats
get_memory_stats() {
    echo "Memory Usage:"
    free -h | grep -E "Mem|Swap"
    echo
}

# Function to get Disk Usage
get_disk_stats() {
    echo "Disk Usage:"
    df -h | grep -vE '^Filesystem|tmpfs|cdrom'
    echo
}

# Function to get Network stats
get_network_stats() {
    echo "Network Usage:"
    ifstat -i eth0 1 1
    echo
}

# Function to get Load Average stats
get_load_avg() {
    echo "Load Average:"
    uptime
    echo
}

# Function to check system uptime
get_uptime() {
    echo "System Uptime:"
    uptime -p
    echo
}

# Function to get System Information
get_system_info() {
    echo "System Information:"
    uname -a
    echo
}

# Main execution
echo "----- Server Stats - $(date) -----"
get_cpu_stats
get_memory_stats
get_disk_stats
get_network_stats
get_load_avg
get_uptime
get_system_info
echo "-----------------------------------"
