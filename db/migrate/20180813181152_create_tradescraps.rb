class CreateTradescraps < ActiveRecord::Migration
  def change
    create_table :tradescraps do |t|
       
       t.references :tradepost, index: true, foreign_key: true
       t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
