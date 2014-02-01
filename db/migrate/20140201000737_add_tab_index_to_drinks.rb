class AddTabIndexToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :tab_index, :integer
  end
end
