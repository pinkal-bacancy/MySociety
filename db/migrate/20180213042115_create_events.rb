class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.date :event_date
      t.string :event_title
      t.string :event_description
      t.references :society, foreign_key: true

      t.timestamps
    end
  end
end
