class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :author,  :user_id
  end
end
