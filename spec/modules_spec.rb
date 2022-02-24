require 'rails_helper'
RSpec.describe User, type: :model do
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'posts_counter should an integer greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
  it 'User module call three_recents_posts correctly' do
    expect(subject.three_recents_posts.length).to eq(0)
  end
end

RSpec.describe Post, type: :model do
  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'title should not be long to 250' do
    subject.title = 'a' * 300
    expect(subject).to_not be_valid
  end
  it 'comments_counter should an integer greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end
  it 'likes_counter should an integer greater than or equal to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
  it 'Post module call five_most_recent_comment correctly' do
    expect(subject.five_most_recent_comment.length).to eq(0)
  end
end
