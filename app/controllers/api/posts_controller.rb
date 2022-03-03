require_relative '../../helpers/api/posts_helper'
class Api::PostsController < ApplicationController
  # GET /posts
  include Api::PostsHelper
  def index
    @posts = Post.all 
    json_response(@posts)
  end
end
