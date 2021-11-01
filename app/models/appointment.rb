class Appointment < ApplicationRecord
    belongs_to :child
    belongs_to :babysitter
end
