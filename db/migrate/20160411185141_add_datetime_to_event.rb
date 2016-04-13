class AddDatetimeToEvent < ActiveRecord::Migration
  def up
    rename_column :events, :time, :oldtime
    add_column :events, :time, :datetime

    Event.all.each do |event|
      d = event.date
      t = event.oldtime
      event.update_attributes! :time => DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
    end

    remove_column :events, :date
    remove_column :events, :oldtime
  end

  def down
    
    add_column :events, :date, :date

    Event.all.each do |event|
      dt = event.time
      event.update_attributes! :date => Date.new(dt.year, dt.month, dt.day)
      event.update_attributes! :time => Time.new(dt.hour, dt.min, dt.sec, dt.zone)
    end
    change_column :events, :time, :time
  end
end
