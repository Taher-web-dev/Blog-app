class AddPostidToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :Postid, :integer
    add_index :likes, :Postid
  end
end
