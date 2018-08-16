class CreateStus < ActiveRecord::Migration
  def change
    create_table :stus do |t|
      t.string :title
      t.text :content
      t.string :country
      t.string :writer
      t.boolean :state

      t.timestamps null: false
    end
  end
end
