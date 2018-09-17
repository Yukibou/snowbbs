class DeleteSomeColumnsToZoneDetails < ActiveRecord::Migration[5.0]
  def change
    remove_columns :zone_details, :boolean
    remove_columns :zone_details, :integer
  end
end
