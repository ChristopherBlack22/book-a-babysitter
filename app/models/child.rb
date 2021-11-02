class Child < ApplicationRecord
    belongs_to :parent
    has_many :bookings, through: :parent

    validates :name, :age, presence: true
end
