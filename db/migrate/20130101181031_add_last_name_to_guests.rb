class AddLastNameToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :last_name, :string
  end
end
