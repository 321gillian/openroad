class AdminController < ApplicationController
  before_action :authorize_admin
  

  def index
  end

  private 
  def authorize_admin
    redirect_to root_path, alert: "Permissions denied" unless
     current_user.admin?
  end

end
