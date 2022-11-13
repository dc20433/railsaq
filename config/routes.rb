Rails.application.routes.draw do
  get "signup" => "users#new"
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  resources :users
  resources :sessions, except: [:index, :edit, :update, :show, :new, :destroy]
  resources :tasks do
    resources :notes
  end

  resources :notes
  get "about" => "sites#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "sites#index"
end
