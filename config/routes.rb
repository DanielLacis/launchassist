Rails.application.routes.draw do
  root to: 'static_pages#root'
  resource :session, only: [:new, :create, :destroy]
  resources :users

  namespace :api, defaults: {format: :json} do

  end
end
