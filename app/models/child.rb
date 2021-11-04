class Child < ApplicationRecord
    belongs_to :parent
    has_many :bookings#, through: :parent
    has_many :babysitters, through: :bookings

    validates :name, :age, presence: true
end
