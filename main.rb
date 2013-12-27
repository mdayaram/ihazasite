require 'rubygems'
require 'sinatra'

# Markdown renderer
require 'glorify'
require 'haml'
require 'sass'

# Config for markdown layout engine.
Tilt.prefer Sinatra::Glorify::Template, '.md', '.markdown', '.mkd'
set :markdown, { :layout_engine => :haml, :layout => :'layouts/markdown' }
# If using modular apps, need to look up how Glorify and sinatra-content-for work

# Stylesheets
get "/stylesheets/:sheet.css" do |sheet|
  content_type 'text/css', :charset => 'utf-8'
  if sheet.nil? or sheet.empty?
    return 404
  end
  scss "stylesheets/#{sheet}".to_sym, :charset => "utf-8"
end

# Routes
get "/p/:mdfile" do |mdfile|
  markdown "markdown/#{mdfile}".to_sym
end

["/", "/index.html"].each do |path|
  get path do
    markdown "markdown/index.html".to_sym
  end
end

["/index.txt", "/text.html"].each do |path|
  get path do
    content_type 'text/plain'
    markdown "markdown/index.html".to_sym
  end
end

["/ua", "/ua.*"].each do |path|
  get path do
    user_agent = request.env["HTTP_USER_AGENT"]
    if user_agent.nil? or user_agent.empty?
      return "Hi there stranger!\n"
    elsif user_agent =~ /iphone/i
      return "Hi there iPhone user!\n"
    elsif user_agent =~ /ipad/i
      return "Hi there iPad user!\n"
    elsif user_agent =~ /ipod/i
      return "Hi there iPod user!\n"
    elsif user_agent =~ /android/i
      return "Hi there Android user!\n"
    else
      return "Hi there Desktop user!\n"
    end
  end
end

get "/lsb" do
  content_type 'text/plain'
  result = `cat /etc/lsb-release`
  result += "\n\n\nChecking if [curl] is installed..."
  result += `dpkg -s curl`
  result += "\n\n\nChecking if [git] is installed..."
  result += `dpkg -s git`
  result += "\n\n\nChecking if [mercurial] is installed..."
  result += `dpkg -s mercurial`
  result += "\n\n\nChecking if [make] is installed..."
  result += `dpkg -s make`
  result += "\n\n\nChecking if [binutils] is installed..."
  result += `dpkg -s binutils`
  result += "\n\n\nChecking if [bison] is installed..."
  result += `dpkg -s bison`
  result += "\n\n\nChecking if [gcc] is installed..."
  result += `dpkg -s gcc`
  result += "\n\n\nChecking [git] exists? " + `which git`
  result += "\n\n\nChecking [mercurial] exists? " + `which hg`
  return result
end
