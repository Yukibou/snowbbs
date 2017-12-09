class AddUserToAvalancheInfomarion < ActiveRecord::Migration[5.0]
  def change
    add_reference :avalanche_infomations, :user
  end
end
