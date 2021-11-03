class Parent < ApplicationRecord
    has_secure_password

    has_many :children
    has_many :bookings
    has_many :babysitters, through: :bookings
    accepts_nested_attributes_for :children, reject_if: :nameless_child?

    validates :first_name, :last_name, :email, :password, presence: true
    validates :email, uniqueness: true#, message: "A Profile already exists for this email address. Please Log In."

    def full_name
        "#{first_name} #{last_name}"
    end 

    private
    def nameless_child?(attributes)
        attributes["name"].blank?
    end
end
