class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :Authorid
      t.string :Title
      t.text :Text
      t.date :CreatedAt
      t.date :UpdatedAt
      t.integer :CommentsCounter
      t.integer :LikesCounter

      t.timestamps
    end
    add_index :posts, :Authorid
  end
end
