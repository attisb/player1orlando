class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.integer :reward_id
      t.integer :user_id
      t.string :code
      t.boolean :used
      t.integer :points

      t.timestamps
    end
  end
end
