class ChangeNiltoZero < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :comments_counter, :integer, default: 0
    change_column :posts, :likes_counter, :integer, default: 0
    change_column :users, :posts_counter, :integer, default: 0
  end
end
