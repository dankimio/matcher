class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :friend
      t.boolean :accepted, default: false

      t.timestamps
    end
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
