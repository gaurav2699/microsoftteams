class RoomMessage < ApplicationRecord
  belongs_to :session,  inverse_of: :room_messages
  belongs_to :user
end
