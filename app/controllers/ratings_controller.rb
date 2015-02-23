class RatingsController < ApplicationController
  
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
 
  before_action :set_post  
  
  def new
    @rating = Rating.new
  end
  
  def edit
  end
 
  def create
    @rating = Rating.new(rating_params)
    @rating.post_id = @post.id
    
    if @rating.save
      redirect_to @post
    else
      render 'new'
    end 
  end
  

  
  def update
    @rating.update(rating_params)
  end
  
  def destroy
    @rating.destroy
    redirect_to root_path
  end
  
  private
    
    def set_rating
      @rating = Rating.find(params[:id])
    end
    
    def set_post
      @post = Post.find(params[:post_id])
    end
    
    def rating_params
      params.require(:rating).permit(:rating_number)
    end

end