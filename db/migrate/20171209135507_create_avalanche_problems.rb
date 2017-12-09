class CreateAvalancheProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :avalanche_problems do |t|
      t.string :avalanche_type
      t.string :zone
      t.string :direction
      t.string :triggering
      t.string :size
      t.string :comments
      t.references :avalanche_infomation

      t.timestamps
    end
  end
end
