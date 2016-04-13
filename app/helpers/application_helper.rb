module ApplicationHelper
	def logoHeader
    	image_tag("logo.png")
  	end
    
  def belongs_to_user?(resource)
    resource.user == current_user
  end
end