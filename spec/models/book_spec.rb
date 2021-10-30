require 'rails_helper'

RSpec.describe Book, type: :model do
  subject {
    Book.new(title: 'Ruby On Rails',
             author: 'john doe',
             progress: '0%', description: 'This book is about ruby on rails framework', user_id: 1)
  }

  it { should belong_to(:user) }

  it { should have_many(:comments) }

  it 'Expect to be valid if all attribute is presence with the right validation' do
    expect(subject).to be_valid
  end

  it 'Expect to be invalid if missing title of the book' do
    subject.title = nil

    expect(subject).to_not be_valid
  end

  it 'Expect to be invalid if the title characters less than 3' do
    subject.title = 'ru'

    expect(subject).to_not be_valid
  end

  it 'Expect to be invalid if the title characters less than 3' do
    subject.author = 'jo'

    expect(subject).to_not be_valid
  end

  it 'Expect to be invalid if missing author' do
    subject.author = nil

    expect(subject).to_not be_valid
  end

  it 'Expect to be invalid if missing progress' do
    subject.progress = nil

    expect(subject).to_not be_valid
  end

  it 'Expect to be invalid if missing description' do
    subject.description = nil

    expect(subject).to_not be_valid
  end

  it 'Expect to be invalid if the description is less than 10' do
    subject.description = 'The book'

    expect(subject).to_not be_valid
  end
end
