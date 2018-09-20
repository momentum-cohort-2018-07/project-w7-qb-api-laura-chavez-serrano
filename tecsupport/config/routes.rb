Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end
  resources :users
  
  root 'questions#index'

  resources :questions, only: [:index]

  resource :session, only: [:new, :create, :destroy]

  resources :sessions, :users, :questions
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
    resource :token, :controller=>"sessions", only: :create
    get 'profile', to: 'users#profile'
    resources :users do
      resources :questions, :controller=>"users/questions", only: [:index, :show]
    end
    resources :questions do
        resources :answers do
         patch 'accept', to: 'answers#accept'
         patch 'reject', to: 'answers#reject'
        end
      end
    end
  end 
end
