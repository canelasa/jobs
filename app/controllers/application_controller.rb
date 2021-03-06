class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?
  def logged_in?
     current_user.present?
  end
end
