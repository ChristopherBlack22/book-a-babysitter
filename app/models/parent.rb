class Parent < ApplicationRecord
    has_secure_password

    has_many :children
    has_many :childrens_appointments, through: :children, source: :appointments
    accepts_nested_attributes_for :children, reject_if: :nameless_child?

    validates :first_name, :last_name, :email, :password, presence: true
    validates :email, uniqueness: true#, message: "A Profile already exists for this email address. Please Log In."


    private
    def nameless_child?(attributes)
        attributes["name"].blank?
    end
end
