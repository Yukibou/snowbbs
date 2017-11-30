class AddTotalCommentsToObservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :general_comments, :string
    add_column :observations, :co_worker, :string
  end
end
