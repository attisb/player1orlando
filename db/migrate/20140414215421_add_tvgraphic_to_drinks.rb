class AddTvgraphicToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :image_tv, :string
  end
end
