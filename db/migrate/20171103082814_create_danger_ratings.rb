class CreateDangerRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :danger_ratings do |t|
      t.references :observation
      t.string :alpine_zone
      t.string :treeline_zone
      t.string :below_treeline_zone
      t.string :comments
      t.string :confidence

      t.timestamps
    end
  end
end
