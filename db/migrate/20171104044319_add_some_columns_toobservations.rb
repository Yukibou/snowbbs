class AddSomeColumnsToobservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :temperature_low, :decimal, precision: 3, scale: 1
    add_column :observations, :temperature_high, :decimal, precision: 3, scale: 1
    add_column :observations, :temperature_low_comments, :string
    add_column :observations, :temperature_high_comments, :string
  end
end
