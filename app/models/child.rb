class Child < ApplicationRecord
    belongs_to :parent
    has_many :bookings#, through: :parent
    has_many :babysitters, through: :bookings

    validates :name, :age, presence: true

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
end
