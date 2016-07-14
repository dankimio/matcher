Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :create, :update] do
      post 'authenticate_facebook', on: :collection
    end

    resource :user, only: [:show] do
      post 'check_in'
    end
  end
end
