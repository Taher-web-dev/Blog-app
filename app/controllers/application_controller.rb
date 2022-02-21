class ApplicationController < ActionController::Base
  def called current_user
    User.first
  end
end
