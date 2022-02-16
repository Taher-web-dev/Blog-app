require "rails_helper"
RSpec.describe "Hello", type: :request do
  it"If a correct template was rendered" do
    get "/"
    expect(response).to render_template(:index)
  end
end
RSpec.describe "Users", type: :request do
  it"If a correct template was rendered" do
    get "/users"
    expect(response).to render_template(:index)
    get "/users/17"
    expect(response).to render_template(:show)
  end
end
RSpec.describe "Posts", type: :request do
  it "If a correct template was rendered" do
    get "/users/17/posts"
    expect(response).to render_template(:index)
    get "/users/17/posts/1"
    expect(response).to render_template(:show)
  end
end