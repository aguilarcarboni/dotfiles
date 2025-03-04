#!/bin/bash

# This script is used to decrypt the dotfiles in the current directory.
# Do not use this to install the dotfiles on the user's machine.

set -e
set -o pipefail

cd ../
echo "Decrypting heavier files..."

# Decrypt the zip
read -sp "Enter your passphrase to decrypt your files: " passphrase
gpg --batch --passphrase ${passphrase} --decrypt encrypted.tar.gz.gpg > encrypted.tar.gz

# Extract the zip
tar xzf encrypted.tar.gz

# Remove the zip
rm encrypted.tar.gz

# Remove the encrypted file
rm encrypted.tar.gz.gpg

echo "Done\n"