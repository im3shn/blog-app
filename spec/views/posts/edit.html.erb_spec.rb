require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let!(:topic){
    Topic.create!(
      name: 'name'
    )
  }
  let(:post) {
    topic.posts.create!(
      headline: "MyString",
      content: "MyText",
      topic: topic
    )
  }

  before(:each) do
    assign(:post, post)
  end

  it "should render" do
    view.render(file: "app/views/posts/edit.html.erb")
    # puts post.id 3
    # puts post.topic.id 1
  end

  it "renders the edit post form" do
    # view.render(file: "app/views/posts/edit.html.erb")
    view.render(file: "app/views/posts/_form.html.erb")
    # puts view.render(file: "app/views/posts/_form.html.erb")
    # puts view.render(file: "app/views/posts/edit.html.erb")
    # puts post.id
    puts post.topic.id
    assert_select 'h1'
    # puts assert_select "form[:action=?][:method=?]", topic_post_path(topic.id, post.id), "post"

      # assert_select "input[name=?]", "post[headline]"
      #
      # assert_select "textarea[name=?]", "post[content]"
      #
      # assert_select "input[name=?]", "post[topic_id]"
    # end
  end
end
