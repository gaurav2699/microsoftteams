class VideoController < ApplicationController

  def set_opentok_vars
    @api_key = ENV['OPENTOK_API_KEY']
    @api_secret = ENV['OPENTOK_API_SECRET']
    @session_id = Session.create_or_load_session
    @moderator_name = ENV['MODERATOR_NAME']
    @name ||= params[:name]
    @token = Session.create_token(@name, @moderator_name, @session_id)
  end

  def landing
  end

  def index
  end

  def screenshare
    @darkmode = 'dark'
  end

  def name
    @name = name_params[:name]
    if name_params[:password] = 'hello'
      redirect_to party_url(name: @name)
    else
      redirect_to('/', flash: { error: 'Incorrect password' })
    end
  end

  def chat
  end

  private
  def name_params
    params.permit(:name, :password, :authenticity_token, :commit)
  end
end
