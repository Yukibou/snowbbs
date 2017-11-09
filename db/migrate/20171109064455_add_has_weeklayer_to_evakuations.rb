class AddHasWeeklayerToEvakuations < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :has_weak_layer, :boolean, default: false
  end
end
