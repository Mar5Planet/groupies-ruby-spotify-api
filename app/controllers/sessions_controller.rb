class SessionsController < ApplicationController

    def new
    end

    def create
        fan = Fan.find_by(name: params[:fan][:name])
        fan = fan.try(:authenticate, params[:fan][:password])
        return redirect_to(controller: 'sessions', action: 'new') unless fan
    
        session[:fan_id] = fan.id
        @fan = fan
        redirect_to fan_path(@fan)
    end

    def destroy
        session.delete :fan_id
        redirect_to root_path
    end

end