class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.boolean :visible
      t.text :area
      t.integer :order

      t.timestamps
    end
  end
end
