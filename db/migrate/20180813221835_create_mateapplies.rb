class CreateMateapplies < ActiveRecord::Migration
  def change
    create_table :mateapplies do |t|
      t.string :partner
      t.boolean :matching
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
