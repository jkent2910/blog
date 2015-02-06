class RemoveRatingFromRating < ActiveRecord::Migration
  def change
    remove_column :ratings, :rating, :integer
  end
end
