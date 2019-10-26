Rails.application.routes.draw do
  root to: 'complaints#new'
  post '/complaints', to: 'complaints#create'
end
