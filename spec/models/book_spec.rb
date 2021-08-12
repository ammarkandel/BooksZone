require 'rails_helper'

RSpec.describe Book, type: :model do
  before(:each) do
    u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
    u1.save
  end

  context 'Test book model' do
    it 'return true if created book is valid' do
      b1 = Book.new(title: 'test title', author: 'Jhon doe', description: 'about the book', progress: '%0', user_id: 1)
      b1.save
      expect(b1.valid?).to eq(true)
    end

    it 'return false if created expense is invalid missing title' do
      b1 = Book.new(author: 'Jhon doe', description: 'about the book', progress: '%0', user_id: 1)
      b1.save
      expect(b1.valid?).to eq(false)
    end

    it 'return false if created book is invalid length of title' do
      b1 = Book.new(title: 'dd', author: 'Jhon doe', description: 'about the book', progress: '%0', user_id: 1)
      b1.save
      expect(b1.valid?).to eq(false)
    end
  end
end
