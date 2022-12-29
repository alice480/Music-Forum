Rails.application.routes.draw do
  resources :admins
  get 'general/home_page'
  get 'general/profile'
  root 'general#home_page'

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :comments
  resources :reviews do
    resources :comments
  end

  get 'general/profile'
  get '/profile', to: 'general#profile'
  get '/users', to: 'general#home_page'

  get '/reviews/new', to: 'review#new'

  post 'admins/update1', to: 'admins#update1'
  post 'admins/update2', to: 'admins#update2'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
