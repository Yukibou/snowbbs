class AddAreIfToAvalancheInfomations < ActiveRecord::Migration[5.0]
  def change
    add_reference :avalanche_infomations, :area, index: true
  end
end
