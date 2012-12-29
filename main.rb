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

