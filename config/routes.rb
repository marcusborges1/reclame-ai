Rails.application.routes.draw do
  root to: 'complaints#new'
  get '/complaints', to: 'complaints#index'
  post '/complaints', to: 'complaints#create'
end
