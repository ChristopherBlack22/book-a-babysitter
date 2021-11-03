require "pry"
class BookingsController < ApplicationController
    def new
        @booking = Booking.new(parent_id: params[:parent_id])
    end

    def create
       #binding.pry
        @booking = Booking.new(booking_params)
        if @booking.save
            redirect_to parent_booking_path(current_user, @booking)
        else
            render :new
        end 
    end 

    def show
        @booking = Booking.find(params[:id])
    end

    private
    def booking_params
        params.require(:booking).permit(:start_time, :end_time, :parent_id, :babysitter_id, children_ids: [])
    end
end
