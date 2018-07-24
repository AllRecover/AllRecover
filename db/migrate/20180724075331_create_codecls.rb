class CreateCodecls < ActiveRecord::Migration
  def change
    create_table :codecls do |t|
      t.integer :clcd
      t.string :clcdnm

      t.timestamps null: false
    end
  end
end
