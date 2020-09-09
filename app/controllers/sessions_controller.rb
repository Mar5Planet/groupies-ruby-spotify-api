class SessionsController < ApplicationController

    def new
    end

    def create
        user = Find.find_by(name: params[:fan][:name])
        user = user.try(:authenticate, params[:fan][:password])
        return redirect_to(controller: 'sessions', action: 'new') unless user
    
        session[:user_id] = user.id
        @user = user
        redirect_to controller: 'welcome', action: 'homepage'
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

end