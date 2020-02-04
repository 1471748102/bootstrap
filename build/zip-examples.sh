#!/usr/bin/env bash

set -e

#
# Usage
# ---------------
# Run zip-examples.sh from the repository root directory

# Get current version from package.json
version=$(node -p "require('./package.json').version")
version_short=$(node -p "require('./package.json').version_short")

rm -rf "bootstrap-$version-examples"

cp -r "_gh_pages/docs/$version_short/examples/" "bootstrap-$version-examples"
cp -r "_gh_pages/docs/$version_short/dist/" "bootstrap-$version-examples"
rm "bootstrap-$version-examples/index.html"
find "bootstrap-$version-examples" -name "*.html" -exec sed -i "s#\"/docs/$version_short/#\"../#g" '{}' \;
zip -r9 "bootstrap-$version-examples.zip" "bootstrap-$version-examples"
rm -rf "bootstrap-$version-examples"
