 class PostsController < ApplicationController
   
     before_action :authenticate_admin!, except: [:index, :show]
   
     before_action :ensure_post_ownership, only: [:edit, :update, :destroy]
   
   def index
     @posts = Post.order(updated_at: :desc).limit(25)
   end

   def show
     @post = Post.find(params[:id])
     
   end

   def new
     @post = current_admin.posts.build
   end

   def create 
     @post = current_admin.posts.build(post_params)
     
     if @post.save
       redirect_to @post, notice: "Your post has been created!"
     else
       render "new"
     end    
   end
   
 	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :content, :category_ids => []))
			redirect_to @post
		else
			render 'edit'
		end
	end
   
	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end
   
   
  private
   
   def post_params
     params.require(:post).permit(:title, :content, :category_ids => [])
   end

  def ensure_post_ownership
    if current_admin != Post.find(params[:id]).admin
      redirect_to root_path, "You do not have access to do perform that action"
    end
  end
   
   
 end