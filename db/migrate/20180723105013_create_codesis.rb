class CreateCodesis < ActiveRecord::Migration
  def change
    create_table :codesis do |t|
      t.integer :sidocd
      t.string :sidocdnm

      t.timestamps null: false
    end
  end
end
