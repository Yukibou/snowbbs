class CreateAvalancheInfomations < ActiveRecord::Migration[5.0]
  def change
    create_table :avalanche_infomations do |t|
      t.references :area
      t.datetime :announced_at
      t.string :avalanche
      t.string :snowpack
      t.string :weather
      t.string :travel_advisory
      t.string :alpine_zone
      t.string :alpine_trend
      t.string :alpine_confidence
      t.string :alpine_comments
      t.string :treeline_zone
      t.string :treeline_trend
      t.string :treeline_confidence
      t.string :treeline_comments
      t.string :below_treeline_zone
      t.string :below_treeline_trend
      t.string :below_treeline_confidence
      t.string :below_treeline_comments

      t.timestamps
    end
  end
end
