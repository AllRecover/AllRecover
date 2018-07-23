class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :hospital, index: true, foreign_key: true
      t.text :title
      t.text :comment
      t.text :comment
      t.integer :like, default: 0
      t.integer :star

      t.timestamps null: false
    end
  end
end
