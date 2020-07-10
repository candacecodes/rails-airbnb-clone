class HostsController < ApplicationController
    before_action :set_host, only:[:show, :edit, :update]
    helper_method :current_host, :redirect_user 

    def show
        @host = Host.find(params[:id])
        # byebug
    end

    def new
        @host = Host.new(params[:id])
    end
    
    def create
        @host = Host.new(host_params)
        session[:host] = @host.id
        # redirect_to @host
        if @host.save
            redirect_to login_path
        else
            flash[:message] = @host.errors.full_messages
            render :new
        end
    end    

    private

    def host_params
        params.require(:host).permit(:first_name, :last_name, :phone_number, :email_address, :address)
    end

    def set_host
        @host = Host.find(params[:id])
    end
end
