Rails.application.routes.draw do
  resources :snippets

  mount Resque::Server.new, at: '/resque'

  root to: 'snippets#index'
end
