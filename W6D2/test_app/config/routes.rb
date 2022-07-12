Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/chirps', to: 'chirps#index' # manually creates a single route

  resources :chirps, only: [:index, :show,:create, :update, :destroy]
  #shortcut for defining multiple routes
end
