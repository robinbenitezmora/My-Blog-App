class Post < ApplicationRecord
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  after_save :update_post_counter

  validates :title, presence: true, length: { minimum: 5, maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
