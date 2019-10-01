class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :info, :warning

  def authenticate_admin_user!
    authenticate_user!
    redirect_visitor unless current_user.admin
  end
end
