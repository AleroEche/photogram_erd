class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.integer :photo_id
      t.text :comment

      t.timestamps
    end
  end
end
