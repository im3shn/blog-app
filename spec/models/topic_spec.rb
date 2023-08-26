require 'rails_helper'

RSpec.describe Topic, type: :model do

  context "validation test" do
    it "ensures topic presence" do
      topic = Topic.new
      topic.name = nil
      topic.validate
      expect(topic.errors[:name]).to include('can\'t be blank')
    end
  end

  context "association test" do
    it "should have many posts" do
      t = Topic.reflect_on_association(:posts)
      expect(t.macro).to eq(:has_many)
    end
  end
end
