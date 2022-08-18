Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index"
  resources :posts
  resources :users
  resources :companies
  resources :employees
  resources :projects do
    resources :tasks
  end
  resources :developers
  get "/posts/display/:id", to: "posts#display", as: "display_post"
end