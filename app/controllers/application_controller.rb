class ApplicationController < ActionController::Base
 include ApplicationHelper
 
  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def check_for_logged_in
    redirect_to '/' if !logged_in?
  end


end
