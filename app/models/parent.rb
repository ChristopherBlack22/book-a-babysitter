class Parent < ApplicationRecord
    has_secure_password

    has_many :children
    has_many :bookings, through: :children
    accepts_nested_attributes_for :children, reject_if: :nameless_child?

    validates :first_name, :last_name, :email, :password, presence: true
    validates :email, uniqueness: true#, message: "A Profile already exists for this email address. Please Log In."

    def self.from_omniauth(response)
        self.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |p|
            p.first_name = response[:info][:first_name]
            p.last_name = response[:info][:last_name]
            p.email = response[:info][:email]
            p.password = SecureRandom.hex(15)
        end 
    end 


    def full_name
        "#{first_name} #{last_name}"
    end 

    private
    def nameless_child?(attributes)
        attributes["name"].blank?
    end
end
