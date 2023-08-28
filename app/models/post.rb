class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments

  validates :headline, presence: :true
  validates :content, presence: :true
end
