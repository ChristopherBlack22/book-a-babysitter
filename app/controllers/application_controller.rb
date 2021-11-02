class ApplicationController < ActionController::Base

    def current_user
        current_user = Parent.find_by(id: session[:user_id])
    end 

    def logged_in?
        #!!session[:user_id] #turning the value if present into a statement of truthiness
        if current_user
        end 
    end 

    def redirect_if_not_logged_in
        redirect_to "/" unless logged_in?
    end 
end
