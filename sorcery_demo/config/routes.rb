Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

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


  resources :users do
    member do
      get :following, :followers
    end
  end
  # resources :users
  resources :sessions
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only:[:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
