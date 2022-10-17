Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
    devise_for :accounts ,controllers: {
        registrations: 'accounts/registrations',
        omniauth_callbacks: "accounts/omniauth_callbacks"
    }
    resources :accounts,only: [:show]
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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
    resources :orders
    resources :reviews
    resources :checkouts, only: [:create]
    resources :webhooks, only: [:create]

    get "/success", to: "checkouts#success"
    get "/cancel", to: "checkouts#cancel"
    get "/posts/display/:id", to: "posts#display", as: "display_post"
    patch "/accounts/uploadimage/:id", to: "accounts#uploadimage", as: "uploadimage"
    # get '/auth/google_oauth2/callback', to: "omniauths#omniauth"
 end