require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'Testing the like model' do
    subject do
      @user01 = User.new(name: 'Annette', photo: 'https://i.imgur.com/1J3wQYt.jpg', bio: 'I am a software developer')
      @post01 = Post.new(author: @user01, title: 'This is a post', text: 'This is a post text')
      Like.new(author: @user01, post: @post01)
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is only valid with a user' do
      subject.author = nil
      expect(subject).to_not be_valid
    end

    it 'is only valid with a post' do
      subject.post = nil
      expect(subject).to_not be_valid
    end
  end

  context 'Testing the like associations' do
    it 'belongs to a user' do
      assc = described_class.reflect_on_association(:author)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to a post' do
      assc = described_class.reflect_on_association(:post)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
