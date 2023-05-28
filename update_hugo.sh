#!/bin/bash

update_hugo_version() {
  file_path=$1
  new_version=$2

  file_content=$(<"$file_path")
  pattern="HUGO_VERSION = \"[0-9]+\.[0-9]+\.[0-9]+\""

  if [[ $file_content == *"$new_version"* ]]; then
    echo "Hugo is already up to date (version $new_version)"
  else
    if [[ $file_content =~ $pattern ]]; then
      updated_content=$(echo "$file_content" | sed "s@$pattern@HUGO_VERSION = \"$new_version\"@")
      echo "$updated_content" > "$file_path"
      echo "Hugo version updated to $new_version successfully!"
    else
      echo "The target line was not found in the file."
    fi
  fi
}

version=$(curl -sSL "https://github.com/gohugoio/hugo/releases/latest" | grep -oP '(?<=/v)\d+\.\d+\.\d+')
file_path="netlify.toml"

update_hugo_version "$file_path" "$version"

