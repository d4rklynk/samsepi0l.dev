#!/bin/bash

# Get the latest Hugo version from the GitHub releases API
latest_version=$(curl --silent "https://api.github.com/repos/gohugoio/hugo/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# Get the current Hugo version from netlify.toml
current_version=$(grep -Po '(?<=HUGO_VERSION = ")[^"]*' netlify.toml)

# Compare the latest version with the current version
if [[ "$latest_version" == "$current_version" ]]; then
  echo "Hugo version $latest_version is already up to date."
  exit 0
fi

# Update the HUGO_VERSION variable in netlify.toml
sed -i "s/^HUGO_VERSION = \".*\"/HUGO_VERSION = \"$latest_version\"/" netlify.toml

# Set git config
git config --global user.email "contact@simpleprivacy.fr"
git config --global user.name "d4rklynk"

# Commit the changes
git add netlify.toml
git commit -m "Update Hugo version to $latest_version" --quiet

# Push the changes to the remote branch
git push https://github.com/d4rklynk/samsepi0l.dev.git HEAD:main

