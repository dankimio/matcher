Rails.application.routes.draw do
  namespace :api do
    resource :user, only: [:show] do
      post 'check_in'
    end

    resources :users, only: [:index, :create, :update] do
      post 'authenticate_facebook', on: :collection
    end
  end
end
