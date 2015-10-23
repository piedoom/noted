class PhotoPostsController < ApplicationController
  def index
  end

  def create
	  c = Tumblr::Client.new
	  post = PhotoPost.new(photo_post_params)
	  c.photo('doomy.tumblr.com', {data: post.data, caption: post.caption})
	  redirect_to root_path
  end

  private

  def photo_post_params
	  params.require(:photo_post).permit(:data, :caption)
  end

end
