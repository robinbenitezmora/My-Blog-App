class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true

  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def more_recent_posts
    posts.limit(3).order(created_at: :desc)
  end

  def all_posts
    posts.order(created_at: :desc)
  end

  Roles = [ :admin, :default ]

  def is?(requested_role)
    self.role = requested_role.to_s
  end
end
