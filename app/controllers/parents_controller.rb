class ParentsController < ApplicationController

    def new
        @parent = Parent.new
        @parent.children.build
        @parent.children.build
        @parent.children.build
        @parent.children.build
        @parent.children.build
    end 

    def create

    end 

    private
    def parent_params
        params.require(:parent).permit(:username, :email, :password)
    end 
end
