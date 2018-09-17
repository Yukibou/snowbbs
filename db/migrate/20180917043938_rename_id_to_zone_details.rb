class RenameIdToZoneDetails < ActiveRecord::Migration[5.0]
  def change
    rename_column :zone_details, :avalanche_problems_id, :avalanche_problem_id
  end
end
