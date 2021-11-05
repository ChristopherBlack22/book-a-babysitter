class Booking < ApplicationRecord
    belongs_to :child
    belongs_to :babysitter
   
    validates :child, :babysitter, :start_time, :end_time, presence: true
    validate :start_must_come_before_end

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
    def start_must_come_before_end
        if start_time >= end_time
            errors.add(:start_must_come_before_end, "End of Booking cannot come before the Start")
        end 
    end 
end
