Rails.application.routes.draw do
  resources :texts
  resources :users

  post '/', to: 'texts#twilio_webhook'

  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

end
