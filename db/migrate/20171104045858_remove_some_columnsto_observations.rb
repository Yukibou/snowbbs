class RemoveSomeColumnstoObservations < ActiveRecord::Migration[5.0]
  def change
    remove_columns :observations, :elevation_high_comments
    remove_columns :observations, :elevation_low_comments
    remove_columns :observations, :temperature
  end
end
