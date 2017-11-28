class AddHrsToObservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :temperature_low_hrs, :string
    add_column :observations, :temperature_low_elevation, :integer
    add_column :observations, :temperature_high_hrs, :string
    add_column :observations, :temperature_high_elevation, :integer
  end
end
