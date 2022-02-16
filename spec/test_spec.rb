require "rails_helper"
RSpec.describe "Hello", type: :request do
  it"If a correct template was rendered" do
    get "/"
    expect(response).to render_template(:index)
  end
  it "If the response body includes correct placeholder text." do
    get "/"
    expect(response.body).to include("Here is a number of posts  for each username")
  end
end
RSpec.describe "Users", type: :request do
  it"If a correct template was rendered" do
    get "/users"
    expect(response).to render_template(:index)
    get "/users/17"
    expect(response).to render_template(:show)
  end
  it "If the response body includes correct placeholder text." do
    get "/users"
    expect(response.body).to include("list of all users")
    get "/users/17"
    expect(response.body).to include("Here is a profile of")
  end
end
RSpec.describe "Posts", type: :request do
  it "If a correct template was rendered" do
    get "/users/17/posts"
    expect(response).to render_template(:index)
    get "/users/17/posts/1"
    expect(response).to render_template(:show)
  end
  it "If the response body includes correct placeholder text." do
    get "/users/17/posts"
    expect(response.body).to include("Here is a list of posts and interactions for given user")
    get "/users/17/posts/1"
    expect(response.body).to include("Here is post")
  end
end