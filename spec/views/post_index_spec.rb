require 'rails_helper'

RSpec.describe 'User post index page', type: :feature do
  let!(:user1) do
    User.create(
      name: 'Annette',
      photo: 'https://unsplash.com/photos/BGz8vO3pK8k',
      bio: 'I am the forest Engineer'
    )
  end

  let!(:user2) do
    User.create(
      name: 'Laurent',
      photo: 'https://unsplash.com/photos/83QB1Y-3fCM',
      bio: 'I love BBC by working'
    )
  end

  let!(:user3) do
    User.create(
      name: 'Catherine',
      photo: 'https://unsplash.com/photos/2Qk4JZn7x8w',
      bio: 'I am a good cook'
    )
  end

  let!(:post1) do
    Post.create(
      author_id: user1.id,
      title: 'She is my favourite person',
      text: 'I love her so much'
    )
  end

  let!(:post2) do
    Post.create(
      author_id: user1.id,
      title: 'I have not been able to overcome her',
      text: 'I can be better than her'
    )
  end

  let!(:post3) do
    Post.create(
      author_id: user1.id,
      title: 'I am the best',
      text: 'Nobody is like me'
    )
  end

  let!(:post4) do
    Post.create(
      author_id: user1.id,
      title: 'Struggling',
      text: 'I am struggling to be the best'
    )
  end

  let!(:comment) do
    Comment.create(
      post_id: post2.id,
      author_id: user1.id,
      text: 'I am the best.'
    )
  end

  let!(:like) do
    Like.create(
      post_id: post2.id,
      author_id: user1.id
    )
  end

  before(:each) do
    visit user_posts_path(user1)
  end

  it 'I can see the username of all other users' do
    expect(page).to have_content(user1.name)
  end

  it 'I can see the users profile picture' do
    expect(page).to have_css('img')
  end

  it 'I can see the amount of posts each user has written' do
    expect(page).to have_content(user1.posts.count)
  end

  it 'I can see the amount of posts each user has written' do
    expect(page).to have_content(user1.posts.count)
  end

  it 'I can see the amount of comments each user has written' do
    expect(page).to have_content(user1.comments.count)
  end

  it 'I can see the amount of likes each user has written' do
    expect(page).to have_content(user1.likes.count)
  end

  it 'I can see the user\'s posts' do
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post1.text)
  end
end
