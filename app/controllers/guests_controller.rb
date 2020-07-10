class GuestsController < ApplicationController
    helper_method :current_guest, :redirect_user 

    def show
        @guest = Guest.find(params[:id])
    end

    def new
        @guest = Guest.new(params[:id])
    end
    
    def create
        @guest = Guest.new(guest_params)
        session[:guest] = @guest.id
        if @guest.save
            redirect_to login_path
        else
            flash[:message] = @guest.errors.full_messages
            render :new
        end
    end

    private

    def guest_params
        params.require(:guest).permit(:first_name, :last_name, :phone_number, :email_address, :address)
    end
end