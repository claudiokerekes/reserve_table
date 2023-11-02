Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :api do
    namespace :v1 do
      get "report",  to: "report#index"
    end
  end
  devise_scope :user do
    #devise_for :users, controllers: { registrations: 'registrations' }
    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
    authenticated :user do
      root to: 'bookings#index', as: :authenticated_root
      resources :tables
      resources :bookings
    end
  end
end
