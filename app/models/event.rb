class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :user

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

  validates :event_type,
    presence: true,
    length: {maximum: 30}

  has_attached_file :image, url: "/system/:hash.:extension", hash_secret: "abc123"

  validates_attachment :image, :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"] }, :size => { :in => 0..5.megabytes }
    

  def date
    self.time.strftime("%d/%m/%Y")
  end
  
  def self.order_time
    order(:time)
  end

  def self.after (day=Time.now) 
    where("time >= ?", day)
  end

  def self.user_events user
    where(:user => user)
  end
end
