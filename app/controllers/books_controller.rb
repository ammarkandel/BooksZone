class BooksController < ApplicationController
  before_action :set_book, only: %i[change_status change_privacy show destroy edit update]
  decorates_assigned :book

  def index
    @books = Book.includes(:user).where(privacy: 'share')
  end

  def new
    @book_new = Book.new
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id

    respond_to do |format|
      if @book_new.save
        format.html { redirect_to user_profile_path, notice: 'Book was created successfuly' }
      else
        format.html { render 'new' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @book.destroy
        format.html { redirect_to user_profile_path, notice: 'Book was deleted successfuly' }
      else
        format.html { redirect_to book_path, notice: 'Something went wrong while delete book' }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_path, notice: 'Book was updated successfuly' }
      else
        format.html { render 'edit' }
      end
    end
  end

  def show
    @book_comments = @book.comments.order('comments.created_at DESC').includes(:user)
  end

  include BookExtraActions

  private

  def set_book
    @book = Book.find_by_id(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :progress, :user_id)
  end
end
