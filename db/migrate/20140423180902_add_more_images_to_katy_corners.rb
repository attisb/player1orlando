class AddMoreImagesToKatyCorners < ActiveRecord::Migration
  def change
    add_column :katy_corners, :image4, :string
    add_column :katy_corners, :image5, :string
    add_column :katy_corners, :image6, :string
    add_column :katy_corners, :image7, :string
  end
end
