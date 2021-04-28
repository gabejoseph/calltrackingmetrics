Rails.application.routes.draw do
  resources :texts
  resources :users

  post '/', to: 'texts#twilio_webhook'
  
end
