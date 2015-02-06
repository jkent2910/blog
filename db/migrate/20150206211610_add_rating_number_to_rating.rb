class AddRatingNumberToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :rating_number, :integer
  end
end
