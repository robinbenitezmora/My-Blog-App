class ChangeDataTypeForText < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :bio, :string
    change_column :posts, :text, :string
    change_column :comments, :text, :string
  end
end
