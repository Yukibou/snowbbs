class CreateObservations < ActiveRecord::Migration[5.0]
  def change
    create_table :observations do |t|
      t.references :user
      t.datetime :observation_at
      t.string :range
      t.string :mountain
      t.string :location
      t.string :elevation
      t.integer :elevation_low
      t.string :elevation_low_comments
      t.integer :elevation_high
      t.string :elevation_high_comments
      t.integer :temperature
      t.string :sky
      t.string :sky_comments

      t.string :wind_speed
      t.string :wind_direction
      t.string :wind_comments

      t.string :precipitation_type
      t.string :precipitation_rate
      t.string :precipitation_comments
      t.string :avalanches
      t.boolean :avalanche_occurred, default: false
      t.string :snowpack
      t.string :spin_url
      t.string :comments

      t.timestamps
    end
  end
end
