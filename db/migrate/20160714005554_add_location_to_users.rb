class AddLocationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :checked_in_at, :datetime
    add_index :users, [:latitude, :longitude]
  end
end
