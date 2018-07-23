class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :ykiho
      t.string :yadmnm
      t.integer :clcd
      t.integer :sidocd
      t.integer :sggucd
      t.string :addr
      t.string :telno
      t.string :hospurl
      t.integer :drtotcnt
      t.integer :gdrcnt
      t.integer :intncnt
      t.integer :resdntcnt
      t.integer :sdrcnt
      t.float :xpos
      t.float :ypos

      t.timestamps null: false
    end
  end
end
