class BooksController < ApplicationController
  before_action :set_book, only: %i[change_status change_privacy show]
  before_action :authenticate_user!, except: %i[index]

  def index
    @books = Book.where(privacy: 'share')
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path, notice: 'Book was created successfuly' }
      else
        format.html { render 'new' }
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
    params.require(:book).permit(:title, :author, :description, :progress, user_id: current_user.id)
  end
end
