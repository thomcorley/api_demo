Rails.application.routes.draw do
  get "/oauth_tokens/access_token" => "oauth_tokens#access_token"
  get "/oauth_tokens/refresh_token" => "oauth_tokens#refresh_token"

  root 'home#index'
end
