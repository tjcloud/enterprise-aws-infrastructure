
#!/bin/bash

set -u

echo "================================="
echo "CLOUD ENGINEERING HEALTH REPORT"
echo "================================="

echo ""
echo "Report Date:"
date

echo ""
echo "Computer Name:"
hostname

echo ""
echo "Operating System:"
uname -s

echo ""
echo "System Uptime:"
uptime

echo ""
echo "Disk Space:"
df -h .

echo ""
echo "Memory Information:"
sysctl -n hw.memsize

echo ""
echo "Docker Status:"

if docker info >/dev/null 2>&1; then
    echo "PASS: Docker engine is running"
else
    echo "WARNING: Docker engine is not running"
fi

echo ""
echo "Git Repository Status:"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    git status --short
    echo "Git repository detected"
else
    echo "WARNING: Not inside a Git repository"
fi

echo ""
echo "Health report complete."
