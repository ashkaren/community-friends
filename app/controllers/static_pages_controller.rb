class StaticPagesController < ApplicationController
	skip_before_filter :authenticate_user!

  	def about
  	end

  	def contact
  	end

  	def help
  	end
end
