#!/bin/bash
# Delete all .vmfb files in this directory.
# Usage: ./clean_vmfbs.sh

vmfbs=(*.vmfb)
if [ -f "${vmfbs[0]}" ]; then
  echo "Removing ${#vmfbs[@]} .vmfb files ..."
  rm -f *.vmfb
else
  echo "No .vmfb files found."
fi
