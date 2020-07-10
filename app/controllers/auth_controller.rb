class AuthController < ApplicationController
    def login #similar to new
        session.clear
    end
    
    def logout 
        session.clear
        redirect_to login_path 
    end 

    def verify_first_name #similar to post 
        @host = Host.find_by(first_name: params[:auth][:first_name])
        @guest = Guest.find_by(first_name: params[:auth][:first_name])
        if @host 
            session[:host] = @host.id #someone officially signed up/ logged in 
            redirect_to @host
        elsif @guest 
            session[:guest] = @guest.id #someone officially signed up/ logged in 
            redirect_to @guest
        else 
            flash[:message] = "Please enter the right credentials" 
            render :login 
        end 
    end 
end