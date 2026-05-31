#!/bin/sh

# 1. Validate argument
if [ "$1" != "light" ] && [ "$1" != "dark" ]; then
    echo "Usage: $0 [light|dark]"
    exit 1
fi

# 2. Set directory paths
COMMON="common"
VARIANT="$1"
OUT="out"

# 3. Create or clean the output directory
if [ -d "$OUT" ]; then
    echo "Cleaning existing '$OUT' directory..."
    rm -rf "$OUT"
fi
mkdir -p "$OUT"

# 4. Copy and merge directories
if [ -d "$COMMON" ]; then
    echo "Copying '$COMMON' to '$OUT'..."
    cp -a "$COMMON/"* "$OUT/" 2>/dev/null
else
    echo "Warning: '$COMMON' directory not found."
fi

if [ -d "$VARIANT" ]; then
    echo "Merging '$VARIANT' into '$OUT'..."
    cp -a "$VARIANT/"* "$OUT/" 2>/dev/null
else
    echo "Warning: '$VARIANT' directory not found."
fi

echo "Done! Combined contents are available in the '$OUT/' folder."
