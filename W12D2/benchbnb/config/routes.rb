Rails.application.routes.draw do
  root "static_pages#root"
  namespace :api, defaults: {format: :json} do
    resources :users
    resource :session, only: [:create, :destroy]
    resources :benches, only: [:index, :create]
  end

end
