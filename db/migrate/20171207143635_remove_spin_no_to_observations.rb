class RemoveSpinNoToObservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :observations, :spin_no
  end
end
