require 'rails_helper'

RSpec.describe Comment, type: :model do

  subject {
    Comment.new(body: 'Great book I already read it before')
  }

  it { should belong_to(:commentable) }

  it "Expect valid if the all attribute is presence and valid" do
    subject.commentable = subject

    expect(subject).to be_valid
  end

  it "Expect invalid if missing commentable" do
    subject.commentable = nil

    expect(subject).to_not be_valid
  end

  it "Expect invalid if missing body" do
    subject.commentable = subject
    subject.body = nil

    expect(subject).to_not be_valid
  end
end
