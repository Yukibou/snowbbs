class ChangePublishToObservations < ActiveRecord::Migration[5.0]
  def change
    change_column :observations, :publish, :boolean, default: true
  end
end
