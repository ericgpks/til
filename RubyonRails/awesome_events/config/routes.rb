Rails.application.routes.draw do
  root "welcome#index"
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  resource :retirements
  resources :events do
    resources :tickets
  end

  get "status" => "status#index", defaults: { format: "json" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
