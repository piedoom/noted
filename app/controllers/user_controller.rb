class UserController < ApplicationController

  def dashboard
	  if current_user
	  	@dashboard = current_user.tumblr.dashboard #reblog_info: true, notes_info: true
	  
		@photo_post = PhotoPost.new
	  
		@text_post = TextPost.new
 	 end
  end
  def messaging
  end


end
