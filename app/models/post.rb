class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :headline, presence: :true
  validates :content, presence: :true


  def self.tagged_with(name)
    Tag.find_by(name: name).posts
  end
end
