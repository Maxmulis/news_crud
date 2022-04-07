Rails.application.routes.draw do
  resources :news, only: [ :show, :destroy ]

  resources :projects, only: [ :index, :show ] do
    resources :news, only: [ :new, :create ]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"
end
