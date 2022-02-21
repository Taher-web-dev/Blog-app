class Like < ApplicationRecord
  belong_to :user
  belong_to :post
  
  after_save :update_likes_counter
  private
  def update_likes_counter
    Post.increment!(:likes_counter)
  end
end