class CreateAvalancheAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :avalanche_areas do |t|
      t.string :name

      t.timestamps
    end
  end
end
