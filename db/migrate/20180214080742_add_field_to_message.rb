class AddFieldToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :message_from, :string
  end
end
