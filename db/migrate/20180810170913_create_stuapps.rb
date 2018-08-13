class CreateStuapps < ActiveRecord::Migration
  def change
    create_table :stuapps do |t|
      t.string :title
      t.text :content
      t.integer :stu_id
      t.text :writer

      t.timestamps null: false
    end
  end
end
