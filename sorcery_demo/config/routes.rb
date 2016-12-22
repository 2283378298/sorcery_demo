Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcomes#home'
  get '/about', to: 'welcomes#about'
  get '/help', to: 'welcomes#help', as: 'helf'
  get '/contact', to: 'welcomes#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :sessions

end
