class RemoveReviewFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :review, :integer
  end
end
