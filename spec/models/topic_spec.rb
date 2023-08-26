require 'rails_helper'

RSpec.describe Topic, type: :model do

  context "validation test" do
    it "ensures topic presence" do
      topic = Topic.new(name: "T1")
      expect(topic).to be_valid
      topic.name = nil
      expect(topic).to be_invalid
    end
  end
end
