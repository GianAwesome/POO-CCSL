class EventType < ActiveRecord::Base
  has_many :events

  def name_capitalize
    name.capitalize
  end
end