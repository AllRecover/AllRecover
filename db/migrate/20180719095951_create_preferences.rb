class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :dist, default: 5
      t.integer :price, default: 5
      t.integer :grade, default: 5

      t.timestamps null: false
    end
  end
end
