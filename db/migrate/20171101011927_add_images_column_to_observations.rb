class AddImagesColumnToObservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :images, :string, array: true, default: []
  end
end
