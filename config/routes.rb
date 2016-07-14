Rails.application.routes.draw do
  namespace :api do
    resource :user, only: [:show, :update] do
      post 'check_in'
    end

    resources :users, only: [:index, :create] do
      post 'authenticate_facebook', on: :collection

      resources :friendships, only: [:create]
      resources :reports, only: [:create]
    end

    resources :friends, only: [] do
      resources :messages, only: [:index, :create]
    end

    resources :friendships, only: [:index]
  end
end
