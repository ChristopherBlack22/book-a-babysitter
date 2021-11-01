class Babysitter < ApplicationRecord
    has_many :appointments
    has_many :children, through: :appointments
end
