class BookingsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:child_id]
            @child = Child.find(params[:child_id])
            # bookings = @child.bookings.sort{|a,b| a.start_time <=> b.start_time} 
            # @upcoming_bookings = bookings.select{|booking| !booking.has_finished?}
            # @previous_bookings = bookings.select{|booking| booking.has_finished?}
            @upcoming_bookings = Booking.childs_upcoming(@child)
            @previous_bookings = Booking.childs_previous(@child)
        else
            @bookings = Booking.all
        end 
    end 

    def new
        @booking = Booking.new(child_id: params[:child_id])
        session[:child_for_booking_id] = params[:child_id]
    end

    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            redirect_to child_booking_path(@booking.child, @booking)
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
            if @booking.rating
                flash[:alert] = "Rating added to Babysitter Stats"
                redirect_to child_bookings_path(@booking.child)
            else
                redirect_to child_booking_path(@booking.child, @booking)
            end
        else
            render :edit
        end
    end

    def destroy
        @booking = Booking.find_by(id: params[:id])
        child = @booking.child
        flash[:alert] = "Booking has been cancelled"
        @booking.delete
        redirect_to child_bookings_path(child)
    end 

    private
    def booking_params
        params.require(:booking).permit(:start_time, :end_time, :child_id, :babysitter_id, :rating)
    end
end
