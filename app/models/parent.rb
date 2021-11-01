class Parent < ApplicationRecord
    has_secure_password

    has_many :children
    has_many :childrens_appointments, through: :children, source: :appointments
end
