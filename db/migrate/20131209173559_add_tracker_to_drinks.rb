class AddTrackerToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :tracker, :boolean
  end
end
