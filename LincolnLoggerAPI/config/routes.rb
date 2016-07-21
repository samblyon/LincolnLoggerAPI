Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resource :session, only: [:create, :destroy]
    resource :user, only: [:create]
    resources :logs, only: [:index, :create]
  end
end
