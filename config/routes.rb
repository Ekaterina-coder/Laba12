Rails.application.routes.draw do
    get '/login' => 'session#new'
    post '/login' => 'session#create'
    get '/logout' => 'session#destroy'
    
    get '/signup' => 'users#new'
    post '/users' => 'users#create'
    
    get 'index/index'
    root 'index#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
