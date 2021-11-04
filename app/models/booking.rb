class Booking < ApplicationRecord
    belongs_to :child
    belongs_to :babysitter
    #has_many :parents, through: :parent

    validates :child, :babysitter, :start_time, :end_time, presence: true
    validate :start_must_come_before_end

    def formatted_start_time
        start_time.strftime("%b %e, %l:%M %p")
    end 

    def formatted_end_time
        end_time.strftime("%b %e, %l:%M %p")
    end 

    private
    def start_must_come_before_end
        if start_time >= end_time
            errors.add(:start_must_come_before_end, "Start is not before End")
        end 
    end 
end
