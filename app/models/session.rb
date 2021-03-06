require 'opentok'

class Session < ApplicationRecord
  has_many :room_messages, dependent: :destroy, inverse_of: :session
  belongs_to :user
  @opentok = OpenTok::OpenTok.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']

  def self.create_or_load_session
    if Session.any?
      last_session = Session.last
      if last_session && last_session.expired == false
        @session_id = last_session.session_id
        @session_id
      elsif (last_session && last_session.expired == true) || !last_session
        @session_id = create_new_session
      else
        raise 'Something went wrong, please try again'
      end
    else
      @session_id = create_new_session
    end
  end

  def self.create_or_load_private_session(current_user)
    @session_id = create_new_session(current_user)
  end

  def self.create_new_session(current_user)
    session = @opentok.create_session
    record = Session.new
    record.session_id = session.session_id
    record.user = current_user
    record.save
    @session_id = session.session_id
    @session_id
  end

  def self.create_token(user_name, session_id)
    puts("---------------here---------------")
    moderator_name=User.first.name
    puts(@session_id)
    @token = user_name == moderator_name ? @opentok.generate_token(session_id, {role: :moderator}) : @opentok.generate_token(session_id)
  end
end
