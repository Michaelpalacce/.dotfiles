#!/bin/bash

# Function to get CPU usage
get_cpu_usage() {
  top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4) "%"}'
}

# Function to get memory usage
get_memory_usage() {
  free -m | awk 'NR==2 {print int($3/$2 * 100) "%"}'
}

# Function to get CPU temperature
get_cpu_temperature() {
  sensors  | grep 'Composite:' | awk '{print $2}' 2>/dev/null || echo "N/A"
}

# Get the values
cpu=$(get_cpu_usage)
memory=$(get_memory_usage)
temperature=$(get_cpu_temperature)

# Output the formatted string
echo "CPU: $cpu | Memory: $memory | Temperature: $temperature"
