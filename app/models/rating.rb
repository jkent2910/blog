class Rating < ActiveRecord::Base
  belongs_to :post
  
  validates :rating_number, presence: true 
end
