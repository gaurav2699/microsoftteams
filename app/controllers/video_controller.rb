require 'opentok'
class VideoController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :set_opentok_vars
  def set_opentok_vars
    @api_key = ENV['OPENTOK_API_KEY']
    @api_secret = ENV['OPENTOK_API_SECRET']
    @name=current_user.name

  end

  def landing
    @sessions = Session.all.where(:expired => false)
  end

  def index
    @type = params[:type].to_s
    @name = current_user.name
    @session_id = params[:session_id].to_s
    @token = params[:token].to_s
    puts("-----------------over here------------")
    puts(@session_id)
  end

  def screenshare
    @type = params[:type].to_s
    @darkmode = 'dark'
    @name = current_user.name
    @session_id= params[:session_id]
    @token = Session.create_token(@name, @session_id)
  end

  def name
    @name = current_user.name
    @session_id = params[:session_id]
    @token = Session.create_token(@name, @session_id)
    redirect_to videochat_url(type: 0, token: @token, session_id: @session_id)
  end

  def private_call
    @name = current_user.name
    @session_id = Session.create_or_load_private_session
    @token = Session.create_token(@name, @session_id)
    redirect_to videochat_url(type: 1, token: @token, session_id: @session_id)
  end

  def chat
  end

  def roomchat
    @session = Session.find(params[:id]) if params[:id]
    @room_message = RoomMessage.new session: @session
    @room_messages = @session.room_messages.includes(:user)
  end

  def endmeet
    @session = Session.find(params[:id])
    @session.update(expired: true)
    redirect_to root_path
  end

  private
  def name_params
    params.permit(:name, :password, :authenticity_token, :commit)
  end
end
