class AddAuthoridToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :Authorid, :string
    add_index :likes, :Authorid
  end
end
