require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Testing the post model' do
    subject do
      @user01 = User.new(name: 'Annette', photo: 'https://i.imgur.com/1J3wQYt.jpg', bio: 'I am a software developer')
      Post.new(author: @user01, title: 'This is a post', text: 'This is a post text')
    end

    it 'is only valid with a user' do
      subject.author = nil
      expect(subject).to_not be_valid
    end

    it 'is only valid with a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is only valid with a text' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end

  context 'Testing the post associations' do
    it 'belongs to a user' do
      assc = described_class.reflect_on_association(:author)
      expect(assc.macro).to eq :belongs_to
    end

    it 'has many likes' do
      assc = described_class.reflect_on_association(:likes)
      expect(assc.macro).to eq :has_many
    end

    it 'has many comments' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
  end

  context 'The post model should have a method' do
    it 'that returns the post title' do
      @user01 = User.new(name: 'Annette', photo: 'https://i.imgur.com/1J3wQYt.jpg', bio: 'I am a software developer')
      post = Post.new(author: @user01, title: 'This is a post', text: 'This is a post text')
      expect(post.title).to eq('This is a post')
    end
  end
end
