#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Building boilerplate-cli-ui-dart..."

# Compile to native executable
/home/jarancibia/.dart-sdk/dart-sdk/bin/dart compile exe bin/main.dart -o boilerplate-cli-ui-dart

echo "Build complete: ./boilerplate-cli-ui-dart"
echo "Binary size: $(du -h boilerplate-cli-ui-dart | cut -f1)"