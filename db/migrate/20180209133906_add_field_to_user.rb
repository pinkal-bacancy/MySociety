class AddFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :society, foreign_key: true
  end
end
