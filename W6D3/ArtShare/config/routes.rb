Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :artworks, only: [:index]
    resources :comments, only: [:index, :create, :destroy]
  end

  resources :artworks, except: [:index] do
    resources :comments, only: [:index]
  end
  
  resources :artwork_shares, only: [:create, :index]
  delete 'artwork_shares/:artwork_id', to: 'artwork_shares#destroy'
end
