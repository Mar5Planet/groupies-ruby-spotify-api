class FansController < ApplicationController
    before_action :require_logged_in_fan, only: [:show, :index]

    def index 
        @fans = Fan.all
    end 

    def new
        @fan = Fan.new
    end
    
    def show
        @fan = get_fan
        @viewing_fan = Fan.find(session[:fan_id])
        @followed = @viewing_fan.already_follows?(@fan)
        @same_viewer = (@fan == @viewing_fan)
    end

    def follow
        @fan = get_fan
        @viewing_fan = Fan.find(session[:fan_id])
        @viewing_fan.follow(@fan)
        redirect_to fan_path(@fan)
    end

    def unfollow 
        @fan = get_fan
        @viewing_fan = Fan.find(session[:fan_id])
        @viewing_fan.unfollow(@fan)
        redirect_to fan_path(@fan)
    end 

    def create
        @fan = Fan.new(fan_params)
        if @fan.save
            session[:fan_id] = @fan.id
            redirect_to fan_path(@fan)
        else 
            redirect_to root_path
        end 
    end

  


    private
    
    def get_fan
        Fan.find(params[:id])
    end

    def fan_params
        params.require(:fan).permit(:name, :location, :profile_image_url, :password, :password_confirmation)
    end

end
