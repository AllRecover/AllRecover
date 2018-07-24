class CreateCodesubs < ActiveRecord::Migration
  def change
    create_table :codesubs do |t|
      t.string :dgsbjtcd
      t.string :dgsbjtcdnm

      t.timestamps null: false
    end
  end
end
