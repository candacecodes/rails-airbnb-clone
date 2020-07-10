class ReservationsController < ApplicationController
    before_action :set_reservation, only:[:show, :edit, :update, :destroy, :reservation_address]
    # before_action :set_house, only:[:new, :create]

    def new
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
            session[:reservation] = @reservation.id
            redirect_to guest_path(session[:guest])
        else
            flash[:message] = @reservation.errors.full_messages
            render :new
        end
    end

    def update
            if @reservation.update(reservation_params)
            redirect_to @reservation
            else 
            flash[:message] = @reservation.errors.full_messages 
            render :new 
            end
    end

    def destroy
        id = @reservation.guest_id
        @reservation.destroy
        redirect_to guest_path(id)  
    end

    private 
    
    def reservation_params
       params.require(:reservation).permit(:number_of_guests, :reservation_start_date, :reservation_end_date, :guest_id, :house_id)
    end

    def set_reservation
        @reservation = Reservation.find(params[:id])
    end
end