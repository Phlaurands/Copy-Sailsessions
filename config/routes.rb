Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :rides, only: [ :new, :create, :index ]

  resources :rides, only: [:show] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [ :index ]

  get "/rides/search", to: "rides#search", as: :search
  patch "/rides/:id", to: "rides#cancel", as: :cancel_ride

  patch "/bookings/:id", to: "bookings#accept", as: :accept_booking
  patch "/bookings/:id", to: "bookings#decline", as: :decline_booking

  get "/components", to: "pages#components", as: :components
end
