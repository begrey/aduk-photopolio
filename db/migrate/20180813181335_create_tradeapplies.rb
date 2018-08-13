class CreateTradeapplies < ActiveRecord::Migration
  def change
    create_table :tradeapplies do |t|
      t.string :title
      t.text :content
      t.integer :tradepost_id
      t.boolean :matching
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
