class BooksController < ApplicationController
  before_action :set_book, only: %i[change_status change_privacy show destroy edit update]
  before_action :authenticate_user!, except: %i[index]

  def index
    @books = Book.where(privacy: 'share')
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    respond_to do |format|
      if @book.save
        format.html { redirect_to root_path, notice: 'Book was created successfuly' }
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

  def show; end

  include BookActions

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :progress, :user_id)
  end
end
