class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def five_most_recent_comment
    Comment.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    User.find_by(id: user_id).increment!(:posts_counter)
  end
end
