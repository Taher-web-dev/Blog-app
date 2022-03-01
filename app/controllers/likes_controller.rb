class LikesController < ApplicationController
  def create
    current_post = Post.find_by(id: params[:post_id])
    user_id = params[:user_id]
    if current_user.likes.find_by(post_id: params[:post_id])
      redirect_to "/users/#{user_id}/posts/#{params[:post_id]}", info: 'You have already liked this post'
    else
      new_like = Like.new(user: current_user, post: current_post)
      if new_like.save
        flash[:success] = 'New like added successfully'
        redirect_to "/users/#{user_id}/posts/#{params[:post_id]}"
      else
        redirect_to "/users/#{user_id}/posts/#{params[:post_id]}", danger: 'We could not add new like'
      end
    end
  end
end
