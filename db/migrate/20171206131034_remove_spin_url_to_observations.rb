class RemoveSpinUrlToObservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :observations, :spin_url
  end
end
