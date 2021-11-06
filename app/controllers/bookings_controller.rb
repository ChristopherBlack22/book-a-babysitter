require "pry"
class BookingsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:child_id]
            @child = Child.find(params[:child_id])
            bookings = @child.bookings
            @bookings = bookings.sort{|a,b| a.start_time <=> b.start_time}
        else
            @bookings = Booking.all
        end 
    end 

    def new
        @booking = Booking.new(child_id: params[:child_id])
    end

    def create
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

    def edit
        @booking = Booking.find(params[:id])
    end

    def update
        @booking = Booking.find(params[:id])
        @booking.assign_attributes(booking_params)
        if @booking.save
            redirect_to child_path(@booking.child)
        else
            render :edit
        end
    end

    def destroy
        @booking = Booking.find_by(id: params[:id])
        @booking.delete
        redirect_to child_path(@booking.child)
    end 

    private
    def booking_params
        params.require(:booking).permit(:start_time, :end_time, :child_id, :babysitter_id, :rating)
    end
end
