Rails.application.routes.draw do
  resources :authors
  devise_for :users
  root 'pages#home' 
  get 'book/:id/delete',to: "books#destroy"
  resources :books
  resources :users

  namespace :api do 
    namespace :v1 do 
      resources :books
    end
  end
end
