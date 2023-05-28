update_hugo_version() {
  file_path=$1
  new_version=$2

  pattern='HUGO_VERSION = "[0-9]+\.[0-9]+\.[0-9]+"'
  replacement="HUGO_VERSION = \"$new_version\""

  if grep -qE "$pattern" "$file_path"; then
    sed -E "s/$pattern/$replacement/" "$file_path" > "$file_path.tmp" && mv "$file_path.tmp" "$file_path"
    echo "Hugo version updated to $new_version successfully!"
  else
    echo "The target line was not found in the file."
  fi
}

