require_relative '../../helpers/api/posts_helper'
require_relative '../../helpers/api/exception_handler'
class Api::PostsController < ApplicationController
  # GET /posts
  include Api::PostsHelper
  include ExceptionHandler
  before_action :set_post, only: [:show]
  def index
    @posts = Post.all 
    json_response(@posts)
  end
  def show
    @comments = @post.comments
    json_response(@comments)
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
end
