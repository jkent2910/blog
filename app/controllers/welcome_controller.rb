class WelcomeController < ApplicationController
  def index
    @posts = Post.order(updated_at: :desc).limit(25)
    
    @post = Post.all.order("created_at DESC")
  end
end
