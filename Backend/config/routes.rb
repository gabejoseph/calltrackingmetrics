Rails.application.routes.draw do
  resources :texts
  resources :users

  post 'twilio_webhook', to: 'texts#twilio_webhook'
  
end
