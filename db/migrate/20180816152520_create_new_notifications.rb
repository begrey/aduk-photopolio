class CreateNewNotifications < ActiveRecord::Migration
  def change
    create_table :new_notifications do |t|
      t.string :content
      t.belongs_to :user
      t.string :link
      t.timestamps null: false
    end
  end
end
