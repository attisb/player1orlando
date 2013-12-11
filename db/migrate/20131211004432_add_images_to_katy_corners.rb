class AddImagesToKatyCorners < ActiveRecord::Migration
  def change
    add_column :katy_corners, :image1, :string
    add_column :katy_corners, :image2, :string
    add_column :katy_corners, :image3, :string
  end
end
