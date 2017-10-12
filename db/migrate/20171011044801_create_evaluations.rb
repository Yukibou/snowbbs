class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.references :observation
      t.integer :priority, default: 1
      t.string :problem
      t.boolean :has_observe, default: false
      t.string :weak_layer
      t.string :potential_size
      t.string :triggering
      t.string :sensitivity
      t.string :spatial
      t.string :terrain
      t.string :memo
      t.string :zone
      t.string :danger_rating
      t.string :comments
      t.string :confidence

      t.timestamps
    end
  end
end
