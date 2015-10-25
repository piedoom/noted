class UserController < ApplicationController
  def dashboard
	  @dashboard = current_user.tumblr.dashboard #reblog_info: true, notes_info: true
	  @photo_post = PhotoPost.new
	  @text_post = TextPost.new
  end
end
