Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'questions#index'
  resources :questions do
    member do
      post :favorite
      post :unfavorite
      post :upvote
      post :downvote
    end
  end

  resources :answers do
    member do
      post :upvote
      post :downvote
    end
  end
 