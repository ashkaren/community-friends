class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include PublicActivity::StoreController


  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def group
      @group = session[:id]
  end
  helper_method :group
  hide_action :group

  def categ
      @category = session[:cat]
  end
  helper_method :categ
  hide_action :categ

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :sex, :address, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) << [:email, :remember_me]
  end

end
