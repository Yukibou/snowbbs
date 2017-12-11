class AddAreaNameToAvalancheInfomation < ActiveRecord::Migration[5.0]
  def change
    add_column :avalanche_infomations, :area_name, :string
  end
end
