class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :Authorid
      t.integer :Postid
      t.text :Text
      t.date :UpdatedAt
      t.date :CreatedAt

      t.timestamps
    end
    add_index :comments, :Authorid
    add_index :comments, :Postid
  end
end
