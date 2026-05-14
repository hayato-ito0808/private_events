class Event < ApplicationRecord
  belongs_to :creator,
             foreign_key: :creator_id,
             class_name: "User"

  has_many :event_attendances,
           foreign_key: :event_id

  has_many :attendees,
           through: :event_attendances,
           source: :participant
end