class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :user_id
      t.string :group_id

      t.timestamps null: false
    end
  end
end
