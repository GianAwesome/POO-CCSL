class Event < ActiveRecord::Base
  belongs_to :event_type

  validates :title,
    presence: true,
    length: {maximum: 256}

  validates :summary,
    presence: true,
    length: {maximum: 8000}

  validates place:
    length: {maximum: 256}

  validates address:
    length: {maximum: 256}

  validates speaker:
    length: {maximum: 256}

  validates responsible:
    length: {maximum: 256}

  validates performance:
    length: {maximum: 256}

    
end
