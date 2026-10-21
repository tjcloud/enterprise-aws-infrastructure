
#!/bin/bash

set -e

echo "================================="
echo "CLOUD ENGINEERING SETUP CHECK"
echo "================================="

echo ""
echo "Checking required tools..."

for tool in git python3 docker; do
    if command -v "$tool" >/dev/null 2>&1; then
        echo "PASS: $tool is installed"
    else
        echo "FAIL: $tool is missing"
        exit 1
    fi
done

echo ""
echo "Checking project files..."

for file in README.md .gitignore; do
    if [ -f "$file" ]; then
        echo "PASS: $file exists"
    else
        echo "FAIL: $file is missing"
        exit 1
    fi
done

echo ""
echo "All setup checks passed!"
