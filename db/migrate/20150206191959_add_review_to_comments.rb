class AddReviewToComments < ActiveRecord::Migration
  def change
    add_column :comments, :review, :integer
  end
end
