class Book < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  validates :status, :title, :author, :description, :progress, :status, :privacy, presence: true
  STATUS = [:done, :reading]
  PRIVACY = [:share, :private]
end
