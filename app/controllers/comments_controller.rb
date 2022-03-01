class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    post_id = params[:post_id]
    user_id = params[:user_id]
    current_post = Post.find_by(id: post_id)
    comment = Comment.new(user: current_user, post: current_post, **params.require(:comment).permit(:text))
    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment saved successfully'
          begin
            redirect_to "/users/#{user_id}/posts/#{post_id}"
          rescue StandardError
            redirect_to "/users/#{user_id}/posts/#{post_id}"
          end
        else
          flash.now[:danger] = 'Error: Comment could not be saved'
          render :new, locals: { comment: }
        end
      end
    end
  end
  def destroy
    Comment.destroy(params[:comment_id])
    post = Post.find_by(id: params[:post_id])
    new_comments_counter = post.comments_counter - 1
    Post.update(post.id, comments_counter: new_comments_counter)
    redirect_to user_posts_path , success: 'The comment was deleted succefully!'
  end
end
