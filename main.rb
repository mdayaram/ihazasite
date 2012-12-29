require 'sinatra'

# Markdown renderer
require 'redcarpet'

get "/hi" do
  markdown(:hi)
end

get "/" do
  markdown(:index)
end
