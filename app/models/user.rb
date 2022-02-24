class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than: 0}
  def three_recents_posts
    posts.order(created_at: :desc).limit(3)
  end
end
