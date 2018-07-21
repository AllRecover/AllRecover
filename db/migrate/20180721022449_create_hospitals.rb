class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :ykiho
      t.string :name
      t.string :xPos
      t.string :yPos
      t.string :addr
      t.string :telno
      t.string :hospUrl

      t.timestamps null: false
    end
  end
end
