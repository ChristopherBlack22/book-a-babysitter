require "pry"
class SessionsController < ApplicationController

    def new
    end

    def create
        @parent = Parent.find_by(email: params[:email])
        if @parent
            authenticated = @parent.try(:authenticate, params[:password])
            return head(:forbidden) unless authenticated
            session[:user_id] = @parent.id
            redirect_to parent_path(@parent)
        else
            render :new
        end 
    end 

    def omniauth
        @parent = Parent.from_omniauth(request.env['omniauth.auth'])
        if @parent.valid?
            session[:user_id] = @parent.id
            redirect_to parent_path(@parent)
        else
            redirect_to login_path
        end
    end 

    def destroy
        session.delete :user_id
        redirect_to root_path
    end 

end