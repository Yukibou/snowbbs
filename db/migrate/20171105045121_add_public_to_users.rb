class AddPublicToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :public, :boolean, default: true
  end
end
