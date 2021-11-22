class ChildrenController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @children = current_user.children
    end 

    def new
        @child = Child.new(parent_id: params[:parent_id])
    end 

    def create
        @child = Child.new(child_params)
        if @child.save
            redirect_to parent_children_path(@child.parent, @child)
        else
            render :new
        end 
    end 

    def show
        @child = Child.find(params[:id])
        redirect_if_current_user_is_not_parent(@child)
    end

    def destroy
        @child = Child.find_by(id: params[:id])
        redirect_if_current_user_is_not_parent(@child)
        flash[:alert] = "#{@child.name} has been removed from your Family"
        @child.delete
        redirect_to parent_children_path(current_user)
    end 

    private 
    def child_params
        params.require(:child).permit(:name, :date_of_birth, :parent_id)
    end
    
    def redirect_if_current_user_is_not_parent(child)
        if child.parent != current_user
            redirect_to parent_children_path(current_user)
        end 
    end

end
