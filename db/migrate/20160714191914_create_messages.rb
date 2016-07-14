class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :friend

      t.timestamps
    end
    add_foreign_key :messages, :users, column: :friend_id
  end
end
