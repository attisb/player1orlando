class AddBooleansToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :quick_style, :string
    add_column :drinks, :dispense_type, :string
  end
end
