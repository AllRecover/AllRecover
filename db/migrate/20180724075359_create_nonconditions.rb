class CreateNonconditions < ActiveRecord::Migration
  def change
    create_table :nonconditions do |t|
      t.string :mainclass
      t.string :middleclass
      t.string :hospname
      t.string :ykiho
      t.integer :price
      t.float :hostday

      t.timestamps null: false
    end
  end
end
