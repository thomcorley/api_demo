class IndexController < ApplicationController
	require "httparty"

	CONFIG = {
  	client_id: "erJDURQ_fq7mCv_UBALcTQ",
    client_secret: "EsTihFmdsxKUYDMMpMarng",
    redirect_uri_2: "http://localhost:3000/index/callback",
    auth_endpoint: "https://api.sandbox.freeagent.com/v2/approve_app?",
    token_endpoint: "api.sandbox.freeagent.com/v2/token_endpoint"
  }


  def authorize
  	@url = CONFIG[:auth_endpoint] + authorization_params
  end

  def callback
    auth_code = params[:code]

    token_response = HTTParty.post("https://#{CONFIG[:client_id]}:#{CONFIG[:client_secret]}@#{CONFIG[:token_endpoint]}",
      headers: {
        "Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8"
      },
      body: {
        "grant_type" => "authorization_code",
        "code" => auth_code,
        "redirect_uri" => CONFIG[:redirect_uri_2]
      })

      access_token = token_response["access_token"]

      bank_accounts = HTTParty.get("https://api.sandbox.freeagent.com/v2/bank_accounts/id",
        headers: {
          "Authorization" => "Bearer #{access_token}",
          "User-Agent" => "FreeAgent Api Demo"
        })

      puts bank_accounts
  end

  private

  def authorization_params
    params = {
      client_id: CONFIG[:client_id],
      response_type: "code",
      redirect_uri: CONFIG[:redirect_uri_2]
    }

    URI.encode_www_form(params)
  end
end
