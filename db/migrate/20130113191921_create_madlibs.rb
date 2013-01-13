class CreateMadlibs < ActiveRecord::Migration
  def change
    create_table :madlibs do |t|

      t.string :field1
      t.string :field2
      t.string :field3
      t.string :field4
      t.string :field5
      t.string :field6
      t.string :field7
      t.string :field8
      t.string :field9
      t.string :field10
      t.string :field11

      t.integer  :guest_id

      t.timestamps
    end
  end
end
