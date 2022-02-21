class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def five_most_recent_comment
    Comment.order(created_at: :desc).limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    User.increment!(:posts_counter)
  end
end
