class LikesController < ApplicationController
  def create
    current_post = Post.find_by(id: params[:post_id])
    this_user = User.find_by(id: params[:current_user])
    user_id = params[:user_id]
    unless this_user.likes.find_by(post_id: current_post)
      new_like = Like.new(user: this_user, post: current_post)
      new_like.save
    end
    redirect_to "/users/#{user_id}/posts/#{current_post}"
  end
end
