class Booking < ApplicationRecord
    belongs_to :child
    belongs_to :babysitter
   
    validates :child, :babysitter, :start_time, :end_time, presence: true 
    validate :start_must_be_before_end
    validate :maximum_ten_hours

    def formatted_start_time
        start_time.strftime("%b %e, %l:%M %p")
    end 

    def formatted_end_time
        end_time.strftime("%l:%M %p")
    end 

    def has_finished?
        end_time < DateTime.now
    end

    private
    def start_must_be_before_end
        if start_time >= end_time
            errors.add(:start_must_be_before_end, "- Booking cannot End before it Starts")
        end 
    end 

    def maximum_ten_hours
        if end_time > start_time+10.hours
            errors.add(:maximum_ten_hours, "- Bookings is longer than 10 hours")
        end
    end 
end
