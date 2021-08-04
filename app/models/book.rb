class Book < ApplicationRecord
  validates :status, :title, :author, :description, :progress, :status, :privacy, presence: true
  STATUS = [:done, :reading]
  PRIVACY = [:share, :private]
end
