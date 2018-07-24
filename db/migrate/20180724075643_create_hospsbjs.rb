class CreateHospsbjs < ActiveRecord::Migration
  def change
    create_table :hospsbjs do |t|
      t.string :ykiho
      t.integer :dg01
      t.integer :dg02
      t.integer :dg03
      t.integer :dg04
      t.integer :dg05
      t.integer :dg06
      t.integer :dg07
      t.integer :dg08
      t.integer :dg09
      t.integer :dg10
      t.integer :dg11
      t.integer :dg12
      t.integer :dg13
      t.integer :dg14
      t.integer :dg15
      t.integer :dg16
      t.integer :dg17
      t.integer :dg18
      t.integer :dg19
      t.integer :dg20
      t.integer :dg21
      t.integer :dg22
      t.integer :dg23
      t.integer :dg24
      t.integer :dg25
      t.integer :dg26
      t.integer :dg50
      t.integer :dg51
      t.integer :dg52
      t.integer :dg53
      t.integer :dg54
      t.integer :dg55
      t.integer :dg56
      t.integer :dg57
      t.integer :dg58
      t.integer :dg59

      t.timestamps null: false
    end
  end
end
