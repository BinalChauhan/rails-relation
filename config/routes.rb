Rails.application.routes.draw do
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
    devise_for :accounts ,controllers: {
      registrations: 'accounts/registrations',
  }
  resources :accounts,only: [:show]
<<<<<<< HEAD
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
=======
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
>>>>>>> f2ef46f9e509c7427def72ec559949aab7b8df4b
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