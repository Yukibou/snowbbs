class AddSpinNosToObservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :spin_nos, :string
  end
end
