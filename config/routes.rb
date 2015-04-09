Rails.application.routes.draw do
  root to: 'static_pages#root'
  resource :session, only: [:new, :create, :destroy]
  resources :users

  namespace :api, defaults: {format: :json} do
    resources :categories, only: []
    resources :categories, only: [:show, :index] do
      resources :projects, only: [:index]
    end
    resources :projects, only: [:show]

    resources :users, only: [:show]
  end
end
