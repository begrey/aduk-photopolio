class CreateTradeposts < ActiveRecord::Migration
  def change
    create_table :tradeposts do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.text :wantitem
      t.boolean :state
      t.string :category
      t.string :interest

      t.timestamps null: false
    end
  end
end
