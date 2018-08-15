class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      
      t.text :character #성격
      t.text :introduce
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
