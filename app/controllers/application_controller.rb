class ApplicationController < ActionController::Base
  def current_user
    @first_user = User.first
  end
end
