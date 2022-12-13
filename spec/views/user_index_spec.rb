require 'rails_helper'

RSpec.describe 'User pages functionality: user show page', type: :feature do
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

  it 'signs @user / in home' do
    visit '/users'
    expect(page).to have_content('Annette')
    expect(page).to have_content('Laurent')
    expect(page).to have_content('Catherine')
  end

  it 'signs @user /users/ in home' do
    visit '/users'
    click_link 'Annette'
    expect(page).to have_content('Annette')
    expect(page).to have_content('I am the forest Engineer')
  end

  it 'I can see the username of all other users' do
    visit root_path
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end

  it 'I can see the amount of posts each user has written' do
    visit root_path
    expect(page).to have_content(user1.posts.count)
    expect(page).to have_content(user2.posts.count)
  end

  it 'I can see the amount of comments each user has written' do
    visit root_path
    expect(page).to have_content(user1.comments.count)
    expect(page).to have_content(user2.comments.count)
  end
end
