require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        headline: "Headline",
        content: "MyText",
        topic: Topic.first
      ),
      Post.create!(
        headline: "Headline",
        content: "MyText",
        topic: Topic.first
      )
    ])
  end

  it "renders a list of posts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Headline".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(Topic.first.id.to_s), count: 2
    end

  it "renders a list of posts grouped by topic" do
    render edit_topic_post_path(Topic.first, :post)
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Headline".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(Topic.first.id.to_s), count: 2
  end
end
