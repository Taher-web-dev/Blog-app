require 'rails_helper'
RSpec.describe 'Login', type: :system do
  before :all do
    unless User.find_by(email: 'test@gmail.com')
      new_user = User.new(name:'test',email:'test@gmail.com',photo:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyuNFyw05KSucqjifL3PhDFrZLQh7QAS-DTw&usqp=CAU',password:'123456',password_confirmation:'123456')
      new_user.skip_confirmation!
      new_user.save!
    end
  end
  it 'can see the username of all other users' do
    unless User.find_by(email: 'example@gmail.com')
      second_user = User.new(name:'example',email:'example@gmail.com',photo:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU',password:'123456',password_confirmation:'123456')
      second_user.skip_confirmation!
      second_user.save!
    end
    visit new_user_session_path
    within('#new_user') do 
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit users_path
    expect(page).to have_content('example')
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU']")
    expect(page).to have_content('Number of posts')
    idd = User.find_by(email: 'example@gmail.com').id
    click_link("#{idd}")
    expect(page).to have_current_path("/users/#{idd}")
  end
end