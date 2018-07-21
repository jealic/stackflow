Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'questions#index'

  resources :users
  
  namespace :logger do
    root 'questions#index'
    resources :questions
  end
end
