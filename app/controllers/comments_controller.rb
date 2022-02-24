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
    this_user = User.find_by(id: params[:current_user])
    comment = Comment.new(user: this_user, post: current_post, **params.require(:comment).permit(:text))
    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment saved successfully'
          begin
            redirect_to "/users/#{user_id}/posts/#{comment.id}"
          rescue StandardError
            redirect_to "/users/#{user_id}/posts/#{post_id}"
          end
        else
          flash.now[:error] = 'Error: Comment could not be saved'
        end
      end
    end
    
  end
end
