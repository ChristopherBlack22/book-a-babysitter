require "pry"
class ChildrenController < ApplicationController

    def new
        @child = Child.new
    end 

    def create
        binding.pry
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

    private 
    def child_params
        params.require(:child).permit(:name, :age, :parent_id)
    end
end
