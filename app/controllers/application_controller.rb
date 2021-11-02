class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :redirect_if_not_logged_in

    def current_user
        Parent.find_by(id: session[:user_id])
    end 

    def logged_in?
        !current_user.nil?
    end 

    def redirect_if_not_logged_in
        redirect_to "/" unless logged_in?
    end 
end
