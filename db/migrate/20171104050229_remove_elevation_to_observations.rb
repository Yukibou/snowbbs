class RemoveElevationToObservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :observations, :elevation
  end
end
