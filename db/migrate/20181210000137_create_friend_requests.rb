class CreateFriendRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :friend_requests do |t|
      t.integer :receipient_id
      t.integer :sender_id

      t.timestamps
    end
  end
end
