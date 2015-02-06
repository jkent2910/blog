 class PostsController < ApplicationController
   
   def index
     @posts = Post.order(updated_at: :desc).limit(25)
   end

   def show
     @post = Post.find(params[:id])
   end

   def new
     @post = Post.new
   end

   def create
     @post = Post.new(post_params)
     if @post.save
       redirect_to @post
     else
       render "new"
     end
   end
   

  private
   
   def post_params
     params.require(:post).permit(:title, :content, :category_ids => [])
   end

 end