class RemoveAreaNamaToAvalancheInfomations < ActiveRecord::Migration[5.0]
  def change
    remove_column :avalanche_infomations, :area_name
  end
end
