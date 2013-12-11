class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.date :released_at
      t.string :developer
      t.string :publisher
      t.integer :players
      t.string :trailer

      t.timestamps
    end
  end
end
