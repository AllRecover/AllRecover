class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :hospital, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :star
      t.string :comment

      t.timestamps null: false
    end
  end
end
