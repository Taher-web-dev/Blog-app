class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts
  end
  def new 
    @user = User.find_by(id: params[:current_user])
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def create
    this_user = User.find_by(id: params[:current_user])
    new_post = Post.new(user: this_user, **params.require(:post).permit(:title, :text))
    respond_to do |format|
      format.html do 
        if new_post.save
          flash[:success] = "Post saved successfully"
        else
          flash.now[:error] = "Error: Post could not be saved"
        end
      end
    end
    begin
      redirect_to '/users/#{current_user.id }/posts'
    rescue
      redirect_to user_posts_path
    end
  end
end
