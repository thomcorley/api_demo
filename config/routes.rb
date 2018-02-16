Rails.application.routes.draw do
  get 'oauth_token/index'
  resources :oauth_tokens
  resources :contacts
  root 'home#index'
end
