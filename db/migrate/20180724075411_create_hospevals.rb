class CreateHospevals < ActiveRecord::Migration
  def change
    create_table :hospevals do |t|
      t.string :ykiho
      t.string :asmgrd11
      t.string :asmgrd12
      t.string :asmgrd13

      t.timestamps null: false
    end
  end
end
