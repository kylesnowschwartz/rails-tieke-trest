class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :img_url
      t.string :caption
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
