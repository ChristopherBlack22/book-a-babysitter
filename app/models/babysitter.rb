class Babysitter < ApplicationRecord
    has_many :bookings
    has_many :parents, through: :bookings

    def name_and_address
        "#{name} (#{address})"
    end 
end
