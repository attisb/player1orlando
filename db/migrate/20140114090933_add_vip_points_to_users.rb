class AddVipPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :vip_membership_points, :integer
  end
end
