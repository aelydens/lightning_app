Rails.application.routes.draw do
  root "users#index"
  get "/auth/:provider/callback", to: "sessions#create"
  delete "/signout", to: "sessions#destroy", :as => :signout

  resources :users do
    resources :talks
  end

end
