module BookActions
  extend ActiveSupport::Concern

  def change_privacy
    return unless params[:privacy].present? && Book::PRIVACY.include?(params[:privacy].to_sym)

    @book.update(privacy: params[:privacy])
  end

  def change_status
    return unless params[:status].present? && Book::STATUS.include?(params[:status].to_sym)

    @book.update(status: params[:status])
  end
end
