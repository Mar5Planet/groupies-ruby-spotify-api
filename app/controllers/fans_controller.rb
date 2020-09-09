class FansController < ApplicationController

    def index 
        @fans = Fan.all
    end 
    
    def show
        @fan = get_fan
    end

    private
    
    def get_fan
        Fan.find(params[:id])
    end

end
