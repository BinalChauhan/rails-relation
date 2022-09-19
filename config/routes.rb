Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :accounts
  resources :accounts,only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
=======
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
    devise_for :accounts ,controllers: {
      registrations: 'accounts/registrations',
  }
  resources :accounts,only: [:show]
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
>>>>>>> 62fcc1455208215c7b9cd5aae0cceb7aa6737932
  root "products#index"
  resources :posts
  resources :users
  resources :companies
  resources :employees
  resources :projects do
    resources :tasks
  end
  resources :developers
  resources :subtasks
  resources :comments
  resources :products
  resources :carts
  resources :cart_items
  get "/posts/display/:id", to: "posts#display", as: "display_post"
end