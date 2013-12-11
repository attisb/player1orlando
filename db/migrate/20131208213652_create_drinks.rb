class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :brewery
      t.float :abv
      t.text :description
      t.float :price
      t.boolean :visible
      t.integer :beer_style_id
      t.boolean :call_out

      t.timestamps
    end
  end
end
