class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  validates: title, presence: true, length: { in: 1..250 }
  validates: comments_counter, numericality { greater_than 0}
  validates: likes_counter, numericality { greater_than 0}

  def five_most_recent_comment
    Comment.order(created_at: :desc).limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    User.find_by(id: user_id).increment!(:posts_counter)
  end
end
