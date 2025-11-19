#!/bin/bash

# ULEARN LMS Startup Script
# This script starts the Laravel development server

echo "======================================"
echo "  Starting ULEARN LMS"
echo "======================================"
echo ""

# Set Node environment for webpack compatibility
export NODE_OPTIONS=--openssl-legacy-provider

# Navigate to project directory
cd ~/projects/ulearn

# Check if MySQL is running
echo "Checking MySQL status..."
if ! sudo systemctl is-active --quiet mysql; then
    echo "MySQL is not running. Starting MySQL..."
    sudo systemctl start mysql
    sleep 2
fi

echo "✓ MySQL is running"
echo ""

# Clear Laravel cache (optional, helps with issues)
echo "Clearing application cache..."
php artisan config:clear
php artisan cache:clear
php artisan view:clear

echo "✓ Cache cleared"
echo ""

# Start Laravel server
echo "======================================"
echo "  Starting Laravel Server"
echo "======================================"
echo ""
echo "Access your LMS at: http://localhost:8000"
echo ""
echo "Login Credentials:"
echo "  Admin:      admin@ulearn.com / secret"
echo "  Instructor: instructor@ulearn.com / secret"
echo "  Student:    student@ulearn.com / secret"
echo ""
echo "Press Ctrl+C to stop the server"
echo "======================================"
echo ""

php artisan serve
