require 'rails_helper'

RSpec.describe Post, type: :model do
  context "validation test" do
    it "ensures presence of post headline" do
      post = Post.new
      post.headline = nil
      post.validate
      expect(post.errors[:headline]).to include('can\'t be blank')
    end
  it "ensures presence of post content" do
      post = Post.new
      post.content = nil
      post.validate
      expect(post.errors[:headline]).to include('can\'t be blank')
    end
    it "ensures presence of topic id in post" do
      post = Post.new
      post.topic_id = nil
      post.validate
      expect(post.errors[:topic]).to include('must exist')
    end
  end

  context "association test" do
    it "should belong to topic" do
      t = Post.reflect_on_association(:topic)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
