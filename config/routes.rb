Rails.application.routes.draw do
  namespace :api do
    resources :lists do
      resources :tasks, only: [:create, :update, :destroy]
    end
  end
end
