Rails.application.routes.draw do
  get 'shoes/index'

  get 'shoes/show'

  get 'shoes/create'

  get 'shoes/new'

  get 'shoes/edit'

  get 'shoes/update'

  get 'shoes/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  devise_for :users

  resources :shoes do
    resources :rentals, only: [:new, :create]
  end

  resources :rentals, only: [:index, :show]

  # patch 'offers/:id/approve', to: 'offers#approve'
  # patch 'offers/:id/decline', to: 'offers#decline'
  resources :offers, only: [:index] do
    member do
      patch :approve
      patch :decline
    end
  end

  # get '/profile', to: 'users#show'
  resource :profile, only: [:show]
end
