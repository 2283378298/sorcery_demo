Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcomes#home'
  get '/about', to: 'welcomes#about'
  get '/help', to: 'welcomes#help', as: 'helf'
  get '/contact', to: 'welcomes#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users
  resources :sessions

end
