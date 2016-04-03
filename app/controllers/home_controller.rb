class HomeController < ApplicationController
  before_action :set_user, except: :front
  respond_to :html, :js

  def index
end

  private
  def set_user
    @user = current_user
  end
end