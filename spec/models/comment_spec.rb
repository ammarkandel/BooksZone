require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
    u1.save
  end

  context 'test creation of comments' do
    it 'Return true if comment creation is valid' do
      b1 = Book.new(title: 'test title', author: 'Jhon doe', description: 'about the book', progress: '%0', user_id: 1)
      b1.save
      book_comment = b1.comments.new(body: 'Test comments', parent_id: 1, user_id: 1)
      book_comment.save
      expect(book_comment.valid?).to eq(true)
    end

    it 'Return false if comment creation is invalid missing body' do
      b1 = Book.new(title: 'test title', author: 'Jhon doe', description: 'about the book', progress: '%0', user_id: 1)
      b1.save
      book_comment = b1.comments.new(parent_id: 1, user_id: 1)
      book_comment.save
      expect(book_comment.valid?).to eq(false)
    end
  end
end
