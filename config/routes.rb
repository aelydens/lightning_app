Rails.application.routes.draw do
  root "users#index"
  get "sign-up", to: "users#new"
  post "sign-up", to: "users#create"
  delete "sign-out", to: "sessions#destroy"
  get "sign-in", to: "sessions#new"
  post "sign-in", to: "sessions#create"

  resources :users do
    resources :talks
  end

end
