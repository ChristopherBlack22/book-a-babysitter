class Babysitter < ApplicationRecord
    has_many :bookings
    has_many :parents, through: :bookings
end
