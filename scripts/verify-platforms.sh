#!/bin/bash
set -euo pipefail

# Verify that the library compiles for all declared platform targets.
# Usage: ./scripts/verify-platforms.sh

BOLD='\033[1m'
GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

PLATFORMS=(
    "iOS"
    "macOS"
    "tvOS"
    "watchOS"
)

DESTINATIONS=(
    "generic/platform=iOS"
    "generic/platform=macOS"
    "generic/platform=tvOS"
    "generic/platform=watchOS"
)

FAILED=0

for i in "${!PLATFORMS[@]}"; do
    PLATFORM="${PLATFORMS[$i]}"
    DEST="${DESTINATIONS[$i]}"

    printf "${BOLD}Building for %s...${RESET} " "$PLATFORM"

    if xcodebuild build \
        -scheme Datez \
        -destination "$DEST" \
        -quiet \
        2>&1; then
        printf "${GREEN}OK${RESET}\n"
    else
        printf "${RED}FAILED${RESET}\n"
        FAILED=1
    fi
done

echo ""
if [ "$FAILED" -eq 0 ]; then
    printf "${GREEN}${BOLD}All platforms compiled successfully.${RESET}\n"
else
    printf "${RED}${BOLD}Some platforms failed to compile.${RESET}\n"
    exit 1
fi
