class SessionsController < ApplicationController

    def new
        if logged_in?
            redirect_to parent_children_path(current_user)
        end        
    end

    def create
        @parent = Parent.find_by(email: params[:email])
        if @parent && @parent.authenticate(params[:password])
            session[:user_id] = @parent.id
            redirect_to parent_children_path(@parent)
        else
            flash[:alert] = "Log in failed"
            render :new
        end 
    end 

    def omniauth
        if @parent = Parent.from_omniauth(request.env['omniauth.auth'])
            session[:user_id] = @parent.id
            redirect_to parent_children_path(@parent)
        else
            flash[:alert] = "Log in with Google failed"
            redirect_to root_path
        end
    end 

    def destroy
        session.delete :user_id
        redirect_to root_path
    end 

end