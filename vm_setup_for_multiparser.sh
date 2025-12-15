#!/bin/bash

set -e  # exit on error
echo "Start creating the enviroment in the VM for MultiParser library"

# -------------------------
# Make apt fully non-interactive (fix tzdata prompt)
# -------------------------
export DEBIAN_FRONTEND=noninteractive

# -------------------------
# Update apt packages
# -------------------------
sudo apt update -y

echo "Follow official documentation: https://tesseract-ocr.github.io/tessdoc/Installation.html"

echo "Installing tesseract-ocr and libtesseract-dev..."
sudo apt install tesseract-ocr
sudo apt install libtesseract-dev
echo "tesseract-ocr and libtesseract-dev installed successfully..."

echo "Setup completed successfully !!"
