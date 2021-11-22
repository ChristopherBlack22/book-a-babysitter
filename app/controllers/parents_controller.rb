class ParentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

    def new
        if logged_in?
            redirect_to parent_children_path(current_user)
        end
        @parent = Parent.new
        @parent.children.build
        @parent.children.build
        @parent.children.build
    end 

    def create
        @parent = Parent.new(parent_params)
        if @parent.save
            session[:user_id] = @parent.id
            redirect_to parent_children_path(@parent)
        else
            render :new
        end 
    end
    
    private
    def parent_params
        params.require(:parent).permit(:first_name, :last_name, :email, :password, children_attributes: [:name, :date_of_birth])
    end 

end
