class ApplicationController < ActionController::Base
  def called(_current_user)
    User.first
  end
end
