Rails.application.routes.draw do
  resources :tags, param: :name
  
  devise_for :users
  
  resources :posts do
    resources :comments

    # Add routes for like/unlike
    member do
      # put "like" => "posts#like"
      
      post "like", to: "posts#like"
      post "unlike", to: "posts#unlike"
    end
  end
  
  get '/my_posts', to: 'posts#user_posts', as: 'user_posts'

  get 'search', to: "search#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index"
end
