class RemoveCommentsToDangerRatings < ActiveRecord::Migration[5.0]
  def change
    remove_column :danger_ratings, :comments
    remove_column :danger_ratings, :confidence
  end
end
