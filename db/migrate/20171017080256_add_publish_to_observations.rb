class AddPublishToObservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :publish, :boolean, default: false, nil: false
  end
end
