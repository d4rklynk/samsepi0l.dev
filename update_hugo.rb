require 'rest-client'

def update_hugo_version(file_path, new_version)
  file_content = File.read(file_path)

  pattern = /HUGO_VERSION = "\d+.\d+.\d+"/

  if file_content.include?(new_version)
    puts "Hugo is already up to date (version #{new_version})"
  else
    if file_content.match?(pattern)
      updated_content = file_content.gsub(pattern, "HUGO_VERSION = \"#{new_version}\"")
      File.write(file_path, updated_content)
      puts "Hugo version updated to #{new_version} successfully!"
    else
      puts "The target line was not found in the file."
    end
  end
end

res = RestClient.get "https://github.com/gohugoio/hugo/releases/latest"
version = res.net_http_res.uri.to_s.split("/").last[1..-1]

file_path = 'netlify.toml'

update_hugo_version(file_path, version)

