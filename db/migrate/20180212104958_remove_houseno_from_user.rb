class RemoveHousenoFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :house_no, :string
  end
end
