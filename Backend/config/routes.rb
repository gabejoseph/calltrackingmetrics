Rails.application.routes.draw do

  get '/', to: 'texts#index'
  post '/', to: 'texts#create'

  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

end
