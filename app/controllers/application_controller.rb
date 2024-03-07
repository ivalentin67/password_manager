class ApplicationController < ActionController::Base

  def user_password
    @user_password ||= current_user.user_passwords.find_by(password: @password)
  end

  helper_method :user_password
end
