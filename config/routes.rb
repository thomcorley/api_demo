Rails.application.routes.draw do

  get "/index/authorize" => "index#authorize"
  get "index/callback" => "index#callback"
  post "index/webhook" => "index#webhook"

  root 'index#authorize'
end
