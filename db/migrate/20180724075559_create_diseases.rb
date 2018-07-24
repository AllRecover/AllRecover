class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
      t.string :ykiho
      t.string :shwsbjtcdnm
      t.string :mf1
      t.string :mf2
      t.string :mf3
      t.string :mf4
      t.string :mf5

      t.timestamps null: false
    end
  end
end
