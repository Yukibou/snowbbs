class RenameColumnDirectionToAvalancheProblem < ActiveRecord::Migration[5.0]
  def change
    rename_column :avalanche_problems, :direction, :slope_aspect
  end
end
