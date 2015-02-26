class CategoriesController < ApplicationController
  
     before_action :authenticate_admin!, except: [:index, :show]
   
     before_action :ensure_category_ownership, only: [:edit, :update, :destroy]
  

   def index
     @categories = Category.all.order(:name)
   end

   def show
     @category = Category.find(params[:id])
   end

   def new
     @category = current_admin.categories.build
   end

   def create
     
     @category = current_admin.categories.build(category_params)
     
     if @category.save
       redirect_to @category
     else
       render "new"
     end
   end
   

  private
  def category_params
    params.require(:category).permit(:name)
   end
  
  def ensure_category_ownership
    if current_admin != Category.find(params[:id]).admin
      redirect_to root_path, "You do not have access to do perform that action"
    end
  end

 end