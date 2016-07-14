class RenameBirthdayToBirthdateInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :birthday, :birthdate
  end
end
