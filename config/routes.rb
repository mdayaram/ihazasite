Ihazasite::Application.routes.draw do
  root :to => 'something#index'
  match 'something' => 'something#index'
  match ':template' => 'something#template', as: 'markdown_template'
end
