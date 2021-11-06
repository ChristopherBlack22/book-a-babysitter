class Babysitter < ApplicationRecord
    has_many :bookings
    has_many :children, through: :bookings

    validates :name, :address, presence: true

    def name_and_address
        "#{name} (#{address})"
    end 

    def self.sorted_by_rating
        self.all.sort_by{|booking| [-booking.rating, -booking.rated_bookings.count]}
    end
    
    def rating
        if rated_bookings.count > 0
            all_ratings = rated_bookings.collect {|booking| booking.rating}
            all_ratings.sum / rated_bookings.count
        else
            0
        end 
    end

    def rated_bookings
        bookings.select {|booking| !booking.rating.nil?}
    end

end
