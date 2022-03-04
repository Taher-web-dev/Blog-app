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
    # if current_user.update(private_api_key: SecureRandom.hex)
    # redirect_to edit_user_registration_path , notice: "API updated"
    # else
    # redirect_to edit_user_registration_path, alert: "There was an error: #{current_user.errors.full_messages.to_sentence}"
    # end
  end
end
