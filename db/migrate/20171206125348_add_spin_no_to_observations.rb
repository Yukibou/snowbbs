class AddSpinNoToObservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :spin_no, :integer
  end
end
