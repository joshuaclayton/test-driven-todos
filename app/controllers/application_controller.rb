class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.new session[:current_email]
  end
  helper_method :current_user

  def sign_in_as(email)
    session[:current_email] = email
  end

  def ensure_user_logged_in
    if current_user.email.blank?
      redirect_to new_session_path
    end
  end
end
