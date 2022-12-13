require 'rails_helper'

RSpec.describe 'User pages functionality: user show page', type: :feature do
  let!(:user) do
    User.create(
      name: 'Annette',
      photo: 'https://unsplash.com/photos/BGz8vO3pK8k',
      bio: 'I am the forest Engineer'
    )
  end

  let!(:post) do
    Post.create(
      author_id: user.id,
      title: 'She is my favourite person',
      text: 'I love her so much'
    )
  end

  before(:each) do
    visit user_path(user)
  end

  it 'I can see the username of all other users' do
    expect(page).to have_content(user.name)
  end

  it 'I can see the amount of posts each user has written' do
    expect(page).to have_content(user.posts.count)
  end

  it 'I can see the amount of comments each user has written' do
    expect(page).to have_content(user.comments.count)
  end

  it 'I can see the user\'s posts' do
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.text)
  end

  it 'I can redirect me into index page' do
    click_link 'Back'
    expect(page).to have_current_path(users_path)
  end
end
