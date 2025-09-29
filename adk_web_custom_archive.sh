#!/bin/bash

# This script creates a compressed tar archive of the build output directory.

# --- Configuration ---
SOURCE_DIR="dist/agent_framework_web/browser"
OUTPUT_FILENAME="adk_web_custom.tar.gz"
# ---

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory ''''$SOURCE_DIR'''' not found." >&2
  echo "Please run 'ng build' first." >&2
  exit 1
fi

echo "Creating archive of ''''$SOURCE_DIR''''..."

# Create the tar.gz archive.
# The -C flag changes to the specified directory before adding files,
# which prevents the archive from containing the full directory path.
tar -czf "$OUTPUT_FILENAME" -C "$SOURCE_DIR" .

echo "Archive ''''$OUTPUT_FILENAME'''' created successfully."
