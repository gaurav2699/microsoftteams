class RoomMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token


  def create
    @room = Session.find params.dig(:room_message, :session_id)

    @room_message = RoomMessage.create user: current_user,
                                       session: @room,
                                       message: params.dig(:room_message, :message)
  end



end
