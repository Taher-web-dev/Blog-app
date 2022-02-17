class AddDetailsToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :Authorid, :integer
  end
end
