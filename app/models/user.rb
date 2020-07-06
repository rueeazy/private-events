class User < ApplicationRecord
    has_many :created_events, foreign_key: :creator_id, class_name: "Event"
    has_many :invitations, foreign_key: :attendee_id
    has_many :attended_events, through: :invitations

    def live_events
        self.attended_events.past_events
    end

    def past_events
        self.attended_events.live_events
    end
    
end
