class ApplicationController < ActionController::Base
    helper_method :current_guest, :current_host, :redirect_user 

    def logged_in? 
        !!current_user 
    end     
    
    def current_guest 
        guest = Guest.find(session[:guest_id]) if session[:guest_id] 
    end 
    
    def current_host 
        host = Host.find(session[:host_id]) if session[:host_id] 
    end 

    def redirect_user
        if !current_guest || !current_host
            flash[:message] = "Please login to view this data" 
            redirect_to login_path
        elsif current_guest
            redirect_to guest_path
        else 
            redirect_to host_path
        end 
    end     
end
