class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :following_id
      t.integer :followed_id

      t.timestamps null: false
    end
    add_index :follows, :following_id
    add_index :follows, :followed_id
  end
end
