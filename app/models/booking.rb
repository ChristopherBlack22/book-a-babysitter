class Booking < ApplicationRecord
    belongs_to :parent
    belongs_to :babysitter
    has_many :children, through: :parent

    validates :parent, :babysitter, :start, :end, presence: true
    validate :start_must_come_before_end

    private
    def start_must_come_before_end(start_time, end_time)
        if start_time >= end_time
            errors.add(:start_must_come_before_end, "Start is not before End")
        end 
    end 
end
