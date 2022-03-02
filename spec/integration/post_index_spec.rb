require 'rails_helper'
RSpec.describe 'Login', type: :system do
  before :all do
    unless User.find_by(email: 'test@gmail.com')
      new_user = User.new(name:'test',email:'test@gmail.com',photo:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyuNFyw05KSucqjifL3PhDFrZLQh7QAS-DTw&usqp=CAU',password:'123456',password_confirmation:'123456')
      new_user.skip_confirmation!
      new_user.save!
    end
  end
  it 'can test post index features' do
    unless User.find_by(email: 'example@gmail.com')
      second_user = User.new(name:'example',email:'example@gmail.com',photo:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU',password:'123456',password_confirmation:'123456',bio:"I'm a tunisian developer")
      second_user.skip_confirmation!
      second_user.save!
    end
    unless User.find_by(email: 'example@gmail.com').posts_counter == 4
        current_user = User.find_by(email: 'example@gmail.com')
        post_1 = Post.new(user: current_user,title:'management',text:'management is long life learning',comments_counter:0, likes_counter:0)
        post_2 = Post.new(user: current_user,title:'global warming',text:'Global warming is the most challenging problem for human being now',comments_counter:0,likes_counter:0)
        post_3 = Post.new(user: current_user,title:'hapiness',text:'hapiness is ...',comments_counter:0,likes_counter:0)
        post_4 = Post.new(user: current_user,title:'time',text:'time is ...',comments_counter:0,likes_counter:0)
        post_1.save!
        post_2.save!
        post_3.save!
        post_4.save!
        post_1.update_post_counter
        post_2.update_post_counter
        post_3.update_post_counter
        post_4.update_post_counter
    end
    unless Post.find_by(title:'management').comments_counter == 3
      current_user = User.find_by(email: 'example@gmail.com')
      User.update(current_user.id,role: 'admin')
      current_post = Post.find_by(title:'management')
      comment_1 = Comment.create(user:current_user,post:current_post,text:'I like it')
      comment_2 = Comment.create(user:current_user,post:current_post,text:'Agree with u!')
      comment_3 = Comment.create(user:current_user,post:current_post,text:'Bravo!')
      Post.update(current_post.id,likes_counter:2)
    end
    visit new_user_session_path
    within('#new_user') do 
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    visit users_path
    idd = User.find_by(email: 'example@gmail.com').id
    posts = Post.where(user_id: idd)
    post_id = posts[0].id
    click_link("#{idd}")
    click_button "See all posts"
    sleep 10
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU']")
    expect(page).to have_content("example")
    expect(page).to have_content('Number of posts: 4')
    expect(page).to have_content('Post #1')
    expect(page).to have_content('management is')
    expect(page).to have_content('I like it')
    expect(page).to have_content('Comments:3, Likes:2')
    expect(page).to have_content('Pagination')
    click_link("#{post_id}")
    expect(page).to have_current_path("/users/#{idd}/posts/#{post_id}")

 end
end