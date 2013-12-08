class AddFieldsToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :username, :string
    add_column :admins, :emp_code, :integer
    add_column :admins, :has_membership, :boolean
    add_column :admins, :lifetime_points, :integer
    add_column :admins, :used_points, :integer
  end
end
