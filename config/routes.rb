Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :create, :update] do
      post 'authenticate_facebook', on: :collection
    end
  end
end
