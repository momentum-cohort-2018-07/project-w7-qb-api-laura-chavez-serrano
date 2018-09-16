Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end
  resources :users

  root 'questions#index'
  resource :session, only: [:new, :create, :destroy]

  resources :sessions, :users, :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
