class AddAuthoridRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :Authorid, null: false, foreign_key: true
  end
end
