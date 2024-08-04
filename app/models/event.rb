class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true
  validates :location, presence: true

  belongs_to :creator, class_name: "User", foreign_key: 'user_id'
  has_many :event_registrations
  has_many :attendees, :through => :event_registrations, source: :user
end
