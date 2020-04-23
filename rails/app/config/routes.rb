Rails.application.routes.draw do

  resources :articles
  resources :stories
  root "home#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destory"
  get "/about", to: "home#about"
  get  "/signup", to: "users#new"
  resources :users, except: [:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
