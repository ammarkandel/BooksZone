class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, optional: true, class_name: 'Comment'

  validates :body, presence: true, length: { minimum: 3, maximum: 500 }

  def comments
    Comment.where(commentable: commentable, parent_id: id)
  end
end
