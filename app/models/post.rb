class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged
  belongs_to :admin
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :ratings
  has_attached_file :image, 
  :storage => :s3,
  :bucket => ENV["aws_bucket"],
  :s3_credentials => {
    :access_key_id => ENV["aws_access_key_id"],
    :secret_access_key => ENV["aws_secret_access_key_id"] },
  :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :title, :content, :categories, :slug, presence: true 


    
end
