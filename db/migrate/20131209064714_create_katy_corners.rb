class CreateKatyCorners < ActiveRecord::Migration
  def change
    create_table :katy_corners do |t|
      t.string :title
      t.text :brief
      t.text :body_document

      t.timestamps
    end
  end
end
