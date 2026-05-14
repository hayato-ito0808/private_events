Rails.application.routes.draw do
  resources :users
  resources :events
  resources :event_attendances

  get "up" => "rails/health#show", as: :rails_health_check

  root "events#index"
end
