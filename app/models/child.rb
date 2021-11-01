class Child < ApplicationRecord
    belongs_to :parent
    has_many :appointments
    has_many :babysitters, through: :appointments
end
