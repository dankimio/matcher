class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birthday, null: false
      t.string :avatar
      t.string :gender, null: false
      t.string :team
      t.string :bio
      t.string :api_token, null: false
      t.integer :facebook_id, limit: 8
      t.string :facebook_token

      t.timestamps
    end
    add_index :users, :api_token, unique: true
  end
end
