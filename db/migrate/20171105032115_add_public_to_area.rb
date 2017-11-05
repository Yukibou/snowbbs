class AddPublicToArea < ActiveRecord::Migration[5.0]
  def change
    add_column :areas, :public, :boolean, default: true
  end
end
