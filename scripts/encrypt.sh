#!/bin/bash

# This script is used to encrypt the dotfiles in the current directory.
# Do not use this to install the dotfiles on the user's machine.

set -e
set -o pipefail

cd ../
echo "Encrypting heavier files..."

# Create a zip
tar czf encrypted.tar.gz encrypted

# Encrypt the zip
gpg -c encrypted.tar.gz

# Remove the zip
rm encrypted.tar.gz

# Remove the encrypted directory
rm -rf encrypted

echo "Done"