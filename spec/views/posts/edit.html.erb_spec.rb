require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let(:post) {
    Post.create!(
      headline: "MyString",
      content: "MyText",
      topic: nil
    )
  }

  before(:each) do
    assign(:post, post)
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(post), "post" do

      assert_select "input[name=?]", "post[headline]"

      assert_select "textarea[name=?]", "post[content]"

      assert_select "input[name=?]", "post[topic_id]"
    end
  end
end
