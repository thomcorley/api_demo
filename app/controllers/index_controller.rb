class IndexController < ApplicationController
	require "httparty"
  HTTParty::Basement.default_options.update(verify: false)
  protect_from_forgery with: :null_session

	CONFIG = {
  	client_id: "erJDURQ_fq7mCv_UBALcTQ",
    client_secret: "EsTihFmdsxKUYDMMpMarng",
    redirect_uri: "http://localhost:5000/index/callback",
    auth_endpoint: "https://api.int4.fre.ag/v2/approve_app?",
    token_endpoint: "api.int4.fre.ag/v2/token_endpoint"
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
        "redirect_uri" => CONFIG[:redirect_uri]
    })

    access_token = token_response["access_token"]
    puts access_token
  end

  def webhook
    print params
    # Struct.new(
    #   event:  params[:amount],
    #   bank_account_id: params[:bank_account_id],
    #   description: params[:description],
    #   amount: params[:amount],
    # )
  end

  private

  def authorization_params
    params = {
      client_id: CONFIG[:client_id],
      response_type: "code",
      redirect_uri: CONFIG[:redirect_uri]
    }

    URI.encode_www_form(params)
  end
end
