require_relative '../../helpers/api/posts_helper'
require_relative '../../helpers/api/exception_handler'
class Api::PrivateApiKeysController < ApplicationController
  include Api::PostsHelper
  include Api::ExceptionHandler
  before_action :authenticate_user!

  def update
    current_user.update(private_api_key: SecureRandom.hex)
    @new_key = current_user.private_api_key
    json_response(@new_key)
  end
end
