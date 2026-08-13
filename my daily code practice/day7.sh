#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=85

# CPU usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int(100 - $8)}')

# Memory usage
MEM=$(free | awk '/Mem:/ {printf("%d"), $3/$2 * 100}')

echo "CPU Usage: $CPU%"
echo "Memory Usage: $MEM%"

if [ "$CPU" -gt "$CPU_THRESHOLD" ]; then
    echo "WARNING: CPU usage is above ${CPU_THRESHOLD}%"
fi

if [ "$MEM" -gt "$MEM_THRESHOLD" ]; then
    echo "WARNING: Memory usage is above ${MEM_THRESHOLD}%"
fi