class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.integer :maintainance_status
      t.references :user, foreign_key: true
      t.references :maintainance, foreign_key: true

      t.timestamps
    end
  end
end
