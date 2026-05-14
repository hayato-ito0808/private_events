class EventAttendance < ApplicationRecord
    belongs_to :participant,        
                foreign_key: :user_id, 
                class_name: "User"
    belongs_to :attended_event,
                foreign_key: :event_id,
                class_name: "Event"
end
