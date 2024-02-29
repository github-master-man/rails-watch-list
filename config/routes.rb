Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # As a user, I can see all my movie lists

  # HTTP Verb, to: "controller_name#action_name"
  get "home", to: "pages#home"

  get "about", to: "users#about "

  # READ all lists - index

    resources :lists do
      resources :bookmarks, only: [:new, :create] # directs to Bookmarks#new
    end

    resources :bookmarks, only: [:destroy]
end
