#!/bin/bash

# Define variables
OMNISHARP_VERSION="v1.39.11"
OMNISHARP_URL="https://github.com/OmniSharp/omnisharp-roslyn/releases/download/$OMNISHARP_VERSION/omnisharp-linux-x64-net6.0.tar.gz"
OMNISHARP_DIR="$HOME/.local/bin/omnisharp"

# Create the destination directory if it does not exist
mkdir -p $OMNISHARP_DIR

# Download the OmniSharp tar.gz
echo "Downloading OmniSharp version $OMNISHARP_VERSION..."
wget -O /tmp/omnisharp.tar.gz $OMNISHARP_URL

# Extract the tar.gz file to the destination directory
echo "Extracting OmniSharp to $OMNISHARP_DIR..."
tar -xzf /tmp/omnisharp.tar.gz -C $OMNISHARP_DIR

# Clean up
rm /tmp/omnisharp.tar.gz

# Ensure the executable permissions are set
chmod +x $OMNISHARP_DIR/run

echo "OmniSharp version $OMNISHARP_VERSION has been installed to $OMNISHARP_DIR"

