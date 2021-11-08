class Child < ApplicationRecord
    belongs_to :parent
    has_many :bookings
    has_many :babysitters, through: :bookings

    validates :name, :date_of_birth, presence: true
    validate :cannot_be_over_16

    def current_bookings
        bookings.select do |booking|
            booking.end_time > DateTime.now
        end
    end 

    def previous_bookings
        bookings.select do |booking|
            booking.end_time < DateTime.now 
        end 
    end 

    def age
        if Time.now.strftime("%m%d") >= date_of_birth.strftime("%m%d")
            Time.now.year - date_of_birth.year
        else
            (Time.now.year - date_of_birth.year)-1
        end
    end

    private
    def cannot_be_over_16
        if date_of_birth
            if age > 16
                errors.add(:cannot_be_over_16, "- Only Children 16 and under allowed")
            end 
        end 
    end
end
