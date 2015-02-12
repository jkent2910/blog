class Post < ActiveRecord::Base

  belongs_to :admin
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :ratings
  has_attached_file :image, 
  :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :title, :content, :categories, presence: true 


    
end
