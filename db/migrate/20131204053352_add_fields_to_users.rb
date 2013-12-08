class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :emp_code, :integer
    add_column :users, :has_membership, :boolean
    add_column :users, :lifetime_points, :integer
    add_column :users, :used_points, :integer
  end
end
