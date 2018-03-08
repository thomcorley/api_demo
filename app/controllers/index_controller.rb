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
  	
  end

  def callback

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
