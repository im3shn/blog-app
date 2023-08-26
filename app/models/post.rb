class Post < ApplicationRecord
  belongs_to :topic

  validates :headline, presence: :true
  validates :content, presence: :true
end
