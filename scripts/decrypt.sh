#!/bin/bash

set -e
set -o pipefail

###############################################################################
# Decrypt Dotfiles                                                            
###############################################################################

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