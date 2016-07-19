class CreateRejections < ActiveRecord::Migration[5.0]
  def change
    create_table :rejections do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :friend

      t.timestamps
    end
    add_foreign_key :rejections, :users, column: :friend_id
  end
end
