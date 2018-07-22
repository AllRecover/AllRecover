class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :hos_id
      t.integer :user_id
      t.text :title
      t.text :comment
      t.integer :like
      t.float :star

      t.timestamps null: false
    end
  end
end
