class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # DISABLE CSRF PROTECTION
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  def current_user
    @current_user || User.find_by(session_token: params[:session_token])
  end

  def set_current_user(user)
    @current_user = user
  end

  def logout!
    @current_user.reset_session_token!
    @current_user = nil
  end

  def validated?
    !!current_user
  end

  def logged_out?
    !logged_in
  end
end
