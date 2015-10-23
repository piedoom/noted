class UserController < ApplicationController
  def dashboard
	  c = Tumblr::Client.new
	  @dashboard = c.dashboard
	  @photo_post = PhotoPost.new
	  @text_post = TextPost.new
  end
end
