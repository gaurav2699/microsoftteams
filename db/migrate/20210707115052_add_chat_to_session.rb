class AddChatToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :chat, :text
  end
end
