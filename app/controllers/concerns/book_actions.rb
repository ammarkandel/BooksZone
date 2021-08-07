module BookActions
  extend ActiveSupport::Concern

  def change_privacy
    if params[:privacy].present? && Book::PRIVACY.include?(params[:privacy].to_sym)
      @book.update(privacy: params[:privacy])
      redirect_to @book, notice: 'Privacy updated successfuly'
    end
  end

  def change_status
    if params[:status].present? && Book::STATUS.include?(params[:status].to_sym)
      @book.update(status: params[:status])
      redirect_to @book, notice: 'Status updated successfuly'
    end
  end
end
