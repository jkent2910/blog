class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  
  validates :title, :content, :categories, presence: true 
end
