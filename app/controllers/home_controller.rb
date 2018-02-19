require "uri"

class HomeController < ApplicationController

  def index
    @url = Rails.configuration.oauth[:base_uri] + authorisation_params
  end

  private

  def authorisation_params
    hash = {
      client_id: "erJDURQ_fq7mCv_UBALcTQ",
      response_type: "code",
      redirect_uri: Rails.configuration.oauth[:redirect_uri]
    }
    URI.encode_www_form(hash)
  end
end
