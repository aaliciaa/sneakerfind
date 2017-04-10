Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :shoes
  resources :rentals, only: [:index, :create, :new, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  patch 'offers/:id/approve', to: 'offers#approve'
  patch 'offers/:id/decline', to: 'offers#decline'

  get '/profile', to: 'users#show'

end
