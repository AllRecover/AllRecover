class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.text :msg
      t.text :uidx
      t.text :hidx

      t.timestamps null: false
    end
  end
end
