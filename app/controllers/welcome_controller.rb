class WelcomeController < ApplicationController
	skip_before_filter :authenticate_user!

  	  respond_to :html, :js
	  def index
	    @activities = PublicActivity::Activity.all
	  end
end
