require 'httparty'
require 'json'

class OauthTokensController < ApplicationController

  def access_token
    code = code_from_url(request)

    response = HTTParty.post(full_token_uri,
      headers: headers,
      body: {grant_type: "authorization_code", code: code, redirect_uri: con(:redirect_uri)}
    )
    puts response
    # puts JSON.parse(response.to_s)[:access_token]
    create_contact(access_token)
  end

  def create_contact(access_token)
    HTTParty.post("https://api.sandbox.freeagent.com",
      headers: { "Authorization" => "Bearer #{@access_token}" },
      body: { contact: { organisation_name: "Acme Computers" } }
    )
  end

  def code_from_url(request)
    request.params["code"]
  end

  def headers
    {"Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8"}
  end

  def full_token_uri
    "https://#{username_and_password}@#{con(:base_token_uri)}"
  end

  def username_and_password
    con(:client_id) + ":" + con(:secret)
  end

  def con(key)
    Rails.configuration.oauth[key]
  end
end
