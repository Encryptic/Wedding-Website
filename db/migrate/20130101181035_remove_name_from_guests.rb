class RemoveNameFromGuests < ActiveRecord::Migration
  def up
    remove_column :guests, :name
  end

  def down
    add_column :guests, :name, :string
  end
end
