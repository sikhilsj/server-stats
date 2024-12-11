#!/bin/bash

# This script collects server performance stats and outputs them in a Human readable format.

# Function to get CPU stats

get_cpu_stats() {
    echo "CPU Usage:"
    mpstat | grep -i 'all' | awk '{print "User CPU: " $3 "% | System CPU: " $5 "% | Idle CPU: " $12 "%"}'
    echo
}

# Function to get Memory stats (Total, Used, Free, and Percentage)

get_memory_stats() {
    echo "Memory Usage:"
    free -h | grep -E "Mem" | awk '{print "Total: " $2 " | Used: " $3 " | Free: " $4 " | Usage: " $3/$2*100 "%"}'
    echo
}

# Function to get Disk Usage (Total, Used, Free, and Percentage)

get_disk_stats() {
    echo "Disk Usage:"
    df -h --total | grep "total" | awk '{print "Total: " $2 " | Used: " $3 " | Free: " $4 " | Usage: " $5 }'
    echo
}

# Function to get top 5 CPU-consuming processes

get_top_cpu_processes() {
    echo "Top 5 CPU-Consuming Processes:"
    ps aux --sort=-%cpu | head -n 6  # head -n 6 to skip the header row
    echo
}

# Function to get top 5 memory-consuming processes

get_top_memory_processes() {
    echo "Top 5 Memory-Consuming Processes:"
    ps aux --sort=-%mem | head -n 6  # head -n 6 to skip the header row
    echo
}

# Function to check system uptime

get_uptime() {
    echo "System Uptime:"
    uptime -p
    echo
}

# Function to get OS version

get_os_version() {
    echo "OS Version:"
    cat /etc/os-release | grep "PRETTY_NAME" | cut -d "=" -f 2 | tr -d '"'
    echo
}

# Function to get Logged-in users

get_logged_in_users() {
    echo "Logged-In Users:"
    who
    echo
}

# Main execution

echo "----- Server Stats - $(date) -----"
get_cpu_stats
get_memory_stats
get_disk_stats
get_top_cpu_processes
get_top_memory_processes
get_uptime
get_os_version
get_logged_in_users

echo "-----------------------------------"
