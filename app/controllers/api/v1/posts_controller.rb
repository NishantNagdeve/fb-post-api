class Api::V1::PostsController < ApplicationController
  def index
  	@posts = Post.all
  	render json: @posts, only: [:content]
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  	  render json: @post
  	else
  	  render json: {message: "Something went wrong."}, status: 400
  	end
  end

  private

  def post_params
  	params.require(:post).permit(:content, :likes, :user_id)
  end

end
