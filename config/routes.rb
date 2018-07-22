Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'questions#index'
  resources :questions,only: [:show]

  resources :users
  
  namespace :logger do
    root 'questions#index'
    resources :questions do
      member do
        post :upvote
        post :downvote
      end
      resources :answers,only: [:create,:destroy] do
        member do
          post :upvote
          post :downvote
        end
      end
    end
  end
  
end
 