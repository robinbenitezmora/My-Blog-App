require 'spec_helper'

RSpec.describe User, type: :model do
  context 'Searching for a user' do
    it 'returns nil if user does not exist' do
      expect(User.find_by(name: 'Annette')).to eq(nil)
    end
  end

  context 'Testing the user model' do
    subject do
      User.new(name: 'Annette', photo: 'https://i.imgur.com/1J3wQYt.jpg', bio: 'I am a software developer')
    end

    it 'is only valid with a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  context 'Testing the user associations' do
    it 'has many posts' do
      assc = described_class.reflect_on_association(:posts)
      expect(assc.macro).to eq :has_many
    end

    it 'has many comments' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end

    it 'has many likes' do
      assc = described_class.reflect_on_association(:likes)
      expect(assc.macro).to eq :has_many
    end
  end

  context 'The user model should have a method' do
    it 'that returns the user name' do
      user = User.new(name: 'Annette', photo: 'https://i.imgur.com/1J3wQYt.jpg', bio: 'I am a software developer')
      expect(user.name).to eq('Annette')
    end
  end
end
