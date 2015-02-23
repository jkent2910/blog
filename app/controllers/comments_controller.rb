class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
 
  before_action :set_post 
  
  def new
    @comment = Comment.new
  end
 
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    
    if @comment.save
      redirect_to @post
    else
      render 'new'
    end 
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @comment.update(comment_params)
  end
  
  def destroy
    @comment.destroy
    redirect_to root_path
  end
  
  private
    
    def set_comment
      @comment = Comment.find(params[:id])
    end
    
    def set_post
      @post = Post.friendly.find(params[:post_id])
    end
    
    def comment_params
      params.require(:comment).permit(:name, :body)
    end

  
end