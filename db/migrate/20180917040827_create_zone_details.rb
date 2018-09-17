class CreateZoneDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :zone_details do |t|
      t.references :avalanche_problems
      t.integer :zone
      t.boolean :aspect_n, default: false
      t.integer :aspect_n_power, default: 0
      t.boolean :aspect_ne, :boolean, default: false
      t.integer :aspect_ne_power, :integer, default: 0
      t.boolean :aspect_e, :boolean, default: false
      t.integer :aspect_e_power, :integer, default: 0
      t.boolean :aspect_se, :boolean, default: false
      t.integer :aspect_se_power, :integer, default: 0
      t.boolean :aspect_s, :boolean, default: false
      t.integer :aspect_s_power, :integer, default: 0
      t.boolean :aspect_sw, :boolean, default: false
      t.integer :aspect_sw_power, :integer, default: 0
      t.boolean :aspect_w, :boolean, default: false
      t.integer :aspect_w_power, :integer, default: 0
      t.boolean :aspect_nw, :boolean, default: false
      t.integer :aspect_nw_power, :integer, default: 0
      t.timestamps
    end
  end
end
