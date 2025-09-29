#!/bin/bash

set -e

# Extract the tar.gz archive to a temporary directory
tmp_dir=$(mktemp -d)
tar -xzf adk_web_custom.tar.gz -C "$tmp_dir"

DEST_DIR=".venv/lib/python3.12/site-packages/google/adk/cli/browser/"

# check if the target directory exists, if not exit with an error message
if [ ! -d "$DEST_DIR" ]; then
  echo "Error: Target directory $DEST_DIR does not exist."
  exit 1
fi

# Copy all files from the extracted browser directory to the target location
cp -r "$tmp_dir"/* "$DEST_DIR"

# Verify the copy operation
if [ $? -ne 0 ]; then
  echo "Error: Failed to copy files to $DEST_DIR."
  exit 1
fi

# Clean up temporary directory
rm -rf "$tmp_dir"

# cp adk_web_custom/browser/index.html .venv/lib/python3.12/site-packages/google/adk/cli/browser/index.html
# cp adk_web_custom/browser/main-RXC46SZM.js .venv/lib/python3.12/site-packages/google/adk/cli/browser/main-RXC46SZM.js
# cp adk_web_custom/browser/polyfills-B6TNHZQ6.js .venv/lib/python3.12/site-packages/google/adk/cli/browser/polyfills-B6TNHZQ6.js
# cp adk_web_custom/browser/styles-4VDSPQ37.css .venv/lib/python3.12/site-packages/google/adk/cli/browser/styles-4VDSPQ37.css