Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "books/:id" => "books#show"
  delete "books/:id" => "books#destroy"
  resources :publishers
  resource :profile, only: %i{show edit update}
end
