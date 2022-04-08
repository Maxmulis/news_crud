Rails.application.routes.draw do
  resources :users, only: [:show]
  delete 'users/:id/delete_all', to: 'users#delete_all', as: 'user_delete_all'
  resources :news, only: [ :show, :destroy, :index ]

  resources :projects, only: [ :index, :show ] do
    resources :news, only: [ :new, :create ]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"
end
