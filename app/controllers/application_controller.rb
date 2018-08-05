class ApplicationController < ActionController::Base
    include DeviseWhitelist
    protect_from_forgery with: :exception
    helper_method :current_order
    helper_method :current_user
    helper_method :new_order
    add_flash_types :danger, :info, :warning, :success
    
  
    def current_order
      if !session[:order_id].nil?
        Order.find(session[:order_id])
      else
        Order.new
      end
    end

end
