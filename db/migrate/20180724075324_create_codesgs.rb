class CreateCodesgs < ActiveRecord::Migration
  def change
    create_table :codesgs do |t|
      t.integer :sggucd
      t.string :sggucdnm

      t.timestamps null: false
    end
  end
end
