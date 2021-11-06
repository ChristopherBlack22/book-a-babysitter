class StaticController < ApplicationController
    def home
        if logged_in?
            redirect_to parent_path(current_user)
        end
    end 
end 