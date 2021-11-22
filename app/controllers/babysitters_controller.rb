class BabysittersController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @babysitter = Babysitter.new
    end

    def create
        @babysitter = Babysitter.new(babysitter_params)
        if @babysitter.save
            flash[:alert] = "New Babysitter added to Booking options"
            redirect_to new_child_booking_path(session[:child_for_booking_id])
        else
            render :new
        end 
    end

    def stats
        @babysitters_by_rating = Babysitter.sorted_by_rating
    end 

    private
    def babysitter_params
        params.require(:babysitter).permit(:name, :address)
    end 
end
