class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def create
    id = params[:user_id]
    data = params.require(:post).permit(:title, :text)
    new_post = Post.new(user: current_user, title: data[:title], text: data[:text])
    new_post.comments_counter = 0
    new_post.likes_counter = 0
    respond_to do |format|
      format.html do
        if new_post.save
          new_post.update_post_counter
          flash[:success] = 'Post saved successfully'
          begin
            redirect_to "/users/#{current_user.id}/posts"
          rescue StandardError
            redirect_to user_posts_path
          end
        else
          redirect_to "/users/#{id}/posts/new", danger: 'Post could not be saved'

        end
      end
    end
  end

  def destroy
    user = User.find_by(id: params[:user_id])
    new_post_counter = user.posts_counter - 1
    User.update(user.id, posts_counter: new_post_counter)
    Post.destroy(params[:id])
    redirect_to user_posts_path, success: 'Post deleted successfully '
  end
end
