class CreateStuapps < ActiveRecord::Migration
  def change
    create_table :stuapps do |t|
      t.string :title
      t.text :content
      t.integer :stu_id
      t.integer :stupost_writer
      t.text :writer
      t.boolean :state

      t.timestamps null: false
    end
  end
end
