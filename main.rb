require 'sinatra'

# Markdown renderer
require 'glorify'

# Config for markdown layout engine.
Tilt.prefer Sinatra::Glorify::Template, '.md', '.markdown', '.mkd'
set :markdown, { :layout_engine => :haml, :layout => :'layouts/markdown' }
# If using modular apps, need to look up how Glorify and sinatra-content-for work

# Routes
get "/" do
  markdown(:hugs)
end

