class RatingsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])

    @rating = @post.ratings.create(params[:rating].permit(:rating_number))

		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@rating = @post.ratings.find(params[:id])
		@rating.destroy

		redirect_to post_path(@post)
	end
    
    
end