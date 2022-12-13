require 'rails_helper'

RSpec.describe 'User pages functionality: post show page', type: :feature do
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

  let!(:comment) do
    Comment.create(
      post_id: post.id,
      author_id: user.id,
      text: 'I love her so much'
    )
  end

  let!(:like) do
    Like.create(
      post_id: post.id,
      author_id: user.id
    )
  end

  before(:each) do
    visit user_posts_path(user, post)
  end

  it 'I can see the post\'s title' do
    expect(page).to have_content(post.title)
  end

  it 'I can see who wrote the post' do
    expect(page).to have_content(user.name)
  end

  it 'I can see the amount of comments the post has' do
    expect(page).to have_content(post.comments.count)
  end

  it 'I can see the amount of likes the post has' do
    expect(page).to have_content(post.likes.count)
  end

  it 'I can see the username of all other users' do
    expect(page).to have_content(user.name)
  end

  it 'I can see the comments of the post' do
    expect(page).to have_content(comment.text)
  end
end
