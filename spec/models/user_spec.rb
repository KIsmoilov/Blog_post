require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create do |user|
      user.name = 'Khusniddin Ismoilov'
      user.photo = 'https://picsum.photos/400'
      user.bio = 'I am a full-stack software engineer.'
    end
  end

  it 'name should be present' do
    expect(subject.name).to eql('Khusniddin Ismoilov')
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 'string'
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end

  it 'method recent_posts returns the 3 most recent posts' do
    expect(subject.recent_posts).to eq(subject.posts.order(updated_at: :desc).limit(3))
  end
end
