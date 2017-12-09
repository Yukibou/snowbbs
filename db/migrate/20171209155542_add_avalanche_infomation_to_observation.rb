class AddAvalancheInfomationToObservation < ActiveRecord::Migration[5.0]
  def change
    add_reference :observations, :avalanche_infomation
  end
end
