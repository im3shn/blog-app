class Rating < ApplicationRecord
  VALUES = (1..5)
  belongs_to :post

  validates :value, presence: true, inclusion: {in: Rating::VALUES}
end
