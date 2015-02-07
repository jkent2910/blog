class Post < ActiveRecord::Base

  belongs_to :admin
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :ratings
  has_attached_file :image, styles: { :medium => "400x400#", :thumb => "100x100#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :title, :content, :categories, presence: true 


    
end
