class AddAreaToObservations < ActiveRecord::Migration[5.0]
  def change
    add_reference :observations, :area
  end
end
