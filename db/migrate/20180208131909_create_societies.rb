class CreateSocieties < ActiveRecord::Migration[5.1]
  def change
    create_table :societies do |t|
      t.string :society_name
      t.string :address
      t.string :city
      t.string :state
      t.string :contry
      t.string :street_name
      t.string :zipcode

      t.timestamps
    end
  end
end
