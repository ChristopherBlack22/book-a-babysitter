class ParentsController < ApplicationController

    def new
        @parent = Parent.new
        @parent.children.build#(name: "Child 1")
        @parent.children.build
        @parent.children.build
        @parent.children.build
        @parent.children.build
    end 

    def create

    end 

    private
    def parent_params
        params.require(:parent).permit(:first_name, :last_name, :email, :password, children_attributes: [:name, :age])
    end 
end
