class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :name, :string
    add_column :users, :dob, :date
    add_column :users, :gender, :string
    add_column :users, :contact_no, :string
    add_column :users, :house_no, :string
    add_column :users, :commity_member, :boolean
  end
end
