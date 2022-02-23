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
end
