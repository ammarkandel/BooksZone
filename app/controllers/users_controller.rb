class UsersController < ApplicationController

  def profile
    @user = User.find_by(id: current_user.id)
  end
end
