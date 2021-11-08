require "pry"
class ChildrenController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @child = Child.new(parent_id: params[:parent_id])
    end 

    def create
        @child = Child.new(child_params)
        if @child.save
            redirect_to parent_path(@child.parent)
        else
            render :new
        end 
    end 

    def show
        @child = Child.find(params[:id])
    end

    def destroy
        @child = Child.find_by(id: params[:id])
        @child.delete
        redirect_to child_path(@child)
    end 

    private 
    def child_params
        params.require(:child).permit(:name, :date_of_birth, :parent_id)
    end
end
