Rails.application.routes.draw do

  get "/index/authorize" => "index#authorize"
  get "index/callback" => "index#callback"

  root 'index#authorize'
end
