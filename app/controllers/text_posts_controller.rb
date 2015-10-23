class TextPostsController < ApplicationController
  def index
    c = Tumblr::Client.new
    @dashboard = c.dashboard
  end

  def create
    c = Tumblr::Client.new
    c.text('doomy.tumblr.com', {title: post_params[:title], body: post_params[:body]}) 
    redirect_to root_path
  end

  def post_params
	  params.require(:text_post).permit(:body, :title)
  end

end
