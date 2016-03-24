class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:fname, :lname, :address, :email, :password) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:fname, :lname, :address, :email, :password, :current_password) }
        end
end

class AuthenticationController < ApplicationController
  # Turn off user authentication for all actions in this controller
  skip_before_filter :authenticate_user!

  def login
    '...'
  end

  def register
    '...'
  end
end
