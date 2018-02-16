require "uri"

class HomeController < ApplicationController
  BASE_URI = "https://api.sandbox.freeagent.com/v2/approve_app?"

  def index
    @url = BASE_URI + authorisation_params
  end

  private

  def authorisation_params
    hash = {client_id: "erJDURQ_fq7mCv_UBALcTQ", response_type: "code", redirect_uri: "http://localhost:3000/oauth_tokens/new"}
    URI.encode_www_form(hash)
  end
end
