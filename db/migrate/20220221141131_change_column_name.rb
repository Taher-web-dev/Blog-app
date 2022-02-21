class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :user_id, :author
  end
end
