class RemoveColumnAreaToAvalancheInfomation < ActiveRecord::Migration[5.0]
  def change
    remove_reference :avalanche_infomations, :area
  end
end
