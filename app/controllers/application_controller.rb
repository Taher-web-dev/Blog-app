class ApplicationController < ActionController::Base
  add_flash_types :danger
  def called(_current_user)
    User.first
  end
end
