class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_user_is_an_admin
    unless user_signed_in? && current_user.admin?
      redirect_to root_url, alert: 'You must be an Admin to access this.'
    end
  end
end
