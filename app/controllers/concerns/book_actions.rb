module BookActions
  extend ActiveSupport::Concern

  def change_privacy
    return unless params[:privacy].present? && Book::PRIVACY.include?(params[:privacy].to_sym)

    @book.update(privacy: params[:privacy])
    redirect_to @book, notice: 'Privacy updated successfuly'
  end

  def change_status
    return unless params[:status].present? && Book::STATUS.include?(params[:status].to_sym)

    @book.update(status: params[:status])
    redirect_to @book, notice: 'Status updated successfuly'
  end
end
