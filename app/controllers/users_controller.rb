class UsersController < ApplicationController

  def books
    @user_books = Book.where(user_id: current_user.id)
  end
end
