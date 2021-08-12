class Book < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  validates :title, :author, presence: true, length: { minimum: 3, maximum: 25 }
  validates :progress, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 400 }
  STATUS = %i[done reading].freeze
  PRIVACY = %i[share private].freeze
end
