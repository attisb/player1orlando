class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :valid_sunday
      t.boolean :valid_monday
      t.boolean :valid_tuesday
      t.boolean :valid_wednesday
      t.boolean :valid_thursday
      t.boolean :valid_friday
      t.boolean :valid_saturday

      t.timestamps
    end
  end
end
