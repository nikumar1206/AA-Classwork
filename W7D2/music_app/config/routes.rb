Rails.application.routes.draw do
	resources :users, only: [:new, :create, :show]
	resource :session, only: [:new, :create, :destroy]
	resources :bands, only: [:index, :create, :new, :edit, :show, :update, :destroy]
  root "sessions#new"
end
