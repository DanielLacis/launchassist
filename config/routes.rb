Rails.application.routes.draw do
  root to: 'static_pages#root'
  resource :session, only: [:new, :create, :destroy]
  resources :users

  namespace :api, defaults: {format: :json} do
    resources :categories, only: []

    resources :categories, only: [:show, :index] do
      resources :projects, only: [:index]
    end

    resources :projects, only: [:create, :update, :destroy]

    resources :projects, only: [:show] do
      resources :tiers, only: [:index]
      resources :pledges, only: [:index]
      resources :comments, only: [:index]
    end

    resources :tiers, only: [:show]

    resources :users, only: [:show]
    resources :pledges, only: [:show, :create, :destroy]
  end

end
