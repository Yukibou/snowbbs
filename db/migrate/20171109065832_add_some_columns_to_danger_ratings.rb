class AddSomeColumnsToDangerRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :danger_ratings, :alpine_comments, :string
    add_column :danger_ratings, :alpine_confidence, :string
    add_column :danger_ratings, :treeline_comments, :string
    add_column :danger_ratings, :treeline_confidence, :string
    add_column :danger_ratings, :below_treeline_comments, :string
    add_column :danger_ratings, :below_treeline_confidence, :string
  end
end
