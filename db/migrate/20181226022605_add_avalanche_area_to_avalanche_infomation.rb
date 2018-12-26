class AddAvalancheAreaToAvalancheInfomation < ActiveRecord::Migration[5.0]
  def change
    add_reference :avalanche_infomations, :avalanche_area, index: true
  end
end
