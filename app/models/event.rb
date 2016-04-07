class Event < ActiveRecord::Base
  belongs_to :event_type

  validates :title,
    presence: true,
    length: {maximum: 256}

  validates :summary,
    presence: true,
    length: {maximum: 8000}

  validates :place,
    length: {maximum: 256}

  validates :address,
    length: {maximum: 256}

  validates :speaker,
    length: {maximum: 256}

  validates :responsible,
    length: {maximum: 256}

  validates :performance,
    length: {maximum: 256}

  has_attached_file :image, url: "/system/:hash.:extension", hash_secret: "abc123"

  validates_attachment :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"] },
  :size => { :in => 0..5.megabytes }
    
end
