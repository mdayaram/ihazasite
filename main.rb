require 'sinatra'

# Markdown renderer
require 'glorify'

# Config for markdown layout engine.
Tilt.prefer Sinatra::Glorify::Template, '.md', '.markdown', '.mkd'
set :markdown, { :layout_engine => :haml, :layout => :'layouts/markdown' }
#register Sinatra::Glorify  #only in modular apps

get "/" do
  markdown(:hugs)
end

