class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :summary
      t.time :time
      t.date :date
      t.string :place
      t.string :address
      t.string :speaker
      t.string :responsible
      t.string :performance
      t.string :url
      t.integer :event_type_id

      t.timestamps null: false
    end
  end
end
