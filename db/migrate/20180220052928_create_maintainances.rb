class CreateMaintainances < ActiveRecord::Migration[5.1]
  def change
    create_table :maintainances do |t|
      t.string :month
      t.integer :amount
      t.date :due_date
      t.references :society, foreign_key: true

      t.timestamps
    end
  end
end
