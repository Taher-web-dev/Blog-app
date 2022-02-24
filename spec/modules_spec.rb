require 'rails_helper'
RSpec.describe User, type: :model do
  #subject {User.new(name: 'taher', photo:'https//kksksk.wom', bio:'tunisian developer')}
  #before { subject.save }
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

