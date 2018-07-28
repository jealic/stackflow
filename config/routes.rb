Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  

  root 'questions#index' 
  resources :questions do
    member do
      post :favorite
      post :unfavorite
      post :upvote
      post :downvote
    end

    resources :answers
  end
  resources :hashtags

  resources :hashtags, only: [:show]

  resources :answers do
    member do
      post :upvote
      post :downvote
    end
  end

  resources :users do
    member do
      get :favoriteboard
    end
  end

  namespace :admin do
    root 'users#index'
  end
end
 