class ChangeBirthdateInUsers < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :birthdate, :date, null: true
  end

  def down
    change_column :users, :birthdate, :date, null: false
  end
end
