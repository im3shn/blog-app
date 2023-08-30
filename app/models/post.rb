class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  has_many :ratings
  has_one_attached :post_image
  has_and_belongs_to_many :users

  validates :headline, presence: true
  validates :content, presence: true


  def self.tagged_with(name)
    Tag.find_by(name: name).posts
  end

  def self.post_topic(topic ="")
    if topic.present?
      topic.name + ' -'
    end
  end

  def self.post_read_status(post, current_user)
    post.users.include?(current_user) ? 'Read': 'Unread'
  end
end
