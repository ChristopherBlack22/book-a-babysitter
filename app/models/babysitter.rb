class Babysitter < ApplicationRecord
    has_many :bookings
    has_many :children, through: :bookings

    validates :name, :age, :address, presence: true

    def name_and_address
        "#{name} (#{address})"
    end 
end
