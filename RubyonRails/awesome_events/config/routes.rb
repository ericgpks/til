Rails.application.routes.draw do
  root "welcome#index"
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  resources :events do
    resources :tickets
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
