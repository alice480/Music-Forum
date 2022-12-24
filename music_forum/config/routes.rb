Rails.application.routes.draw do
  get 'general/home_page'
  get 'general/profile'
  root 'general#home_page'

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :comments
  resources :reviews

  get 'general/profile'
  get '/profile', to: 'general#profile'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
