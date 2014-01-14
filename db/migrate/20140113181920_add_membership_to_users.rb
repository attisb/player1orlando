class AddMembershipToUsers < ActiveRecord::Migration
  def change
    add_column :users, :membership_number, :string
  end
end
