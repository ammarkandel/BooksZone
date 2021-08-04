module BookActions
  extend ActiveSupport::Concern

  def change_privacy
    if params[:privacy].present? && Book::PRIVACY.include?(params[:privacy].to_sym)
      @book.update(privacy: params[:privacy])
    end
  end

  def change_status
    if params[:status].present? && Book::STATUS.include?(params[:status].to_sym)
      @book.update(status: params[:status])
    end
  end
end
