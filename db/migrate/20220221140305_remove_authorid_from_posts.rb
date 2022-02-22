class RemoveAuthoridFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :authorid, :integer
  end
end
