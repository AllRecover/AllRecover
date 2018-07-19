class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :user, index: true, foreign_key: true
      t.string :dist
      t.string :price
      t.string :grade

      t.timestamps null: false
    end
  end
end
