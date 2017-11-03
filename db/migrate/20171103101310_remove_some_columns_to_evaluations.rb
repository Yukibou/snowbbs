class RemoveSomeColumnsToEvaluations < ActiveRecord::Migration[5.0]
  def change
    remove_columns :evaluations, :zone
    remove_columns :evaluations, :danger_rating
    remove_columns :evaluations, :comments
    remove_columns :evaluations, :confidence
  end
end
