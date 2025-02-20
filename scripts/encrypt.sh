#!/bin/bash

###############################################################################
# Encrypt Dotfiles                                                            
###############################################################################

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