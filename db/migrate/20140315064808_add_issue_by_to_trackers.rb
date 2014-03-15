class AddIssueByToTrackers < ActiveRecord::Migration
  def change
    add_column :trackers, :issued_by, :integer
    add_column :trackers, :issued_at, :datetime
  end
end
