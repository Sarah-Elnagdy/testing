class PostsController < ApplicationController
	before_filter :signed_in_user
	before_filter :correct_user, only: :destroy


	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post created!"
			redirect_to root_path
		else
			@feed_items = []
			render 'blogs/home'
		end
	end
	def update
		henaaa
	end

	def show
		render show path
	end


	def destroy
		@post.destroy
		redirect_to root_path
	end

	def edit
		@post = Post.find_by_id(params[:id])
	end

	private
	  def post_params
    params.require(:post).permit(:title, :content)
  end
  def correct_user
   @post = current_user.posts.find_by_id(params[:id])
   redirect_to root_path if @post.nil?
  end
end