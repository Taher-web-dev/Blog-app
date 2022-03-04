require_relative '../../helpers/api/posts_helper'
require_relative '../../helpers/api/exception_handler'
class Api::CommentsController < ApplicationController
  before_action :set_post, only: [:create]
  include Api::PostsHelper
  include Api::ExceptionHandler

  def create
    @new_comment = Comment.create!(user: current_user, post: @post, **todo_params)
    json_response(@new_comment, :created)
  end

  private

  def todo_params
    params.permit(:text)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
