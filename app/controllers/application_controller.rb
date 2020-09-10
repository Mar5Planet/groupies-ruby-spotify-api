class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    before_action :current_fan
  
    def current_fan
      @fan = (Fan.find_by(id: session[:fan_id])) || Fan.new
    end
  
    def fan_logged_in?
      current_fan.id != nil
    end
  
    def require_logged_in_fan
      if !fan_logged_in?
        redirect_to root_path
      end
    end
  
  
end
