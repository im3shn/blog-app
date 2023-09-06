FactoryBot.define do
  factory :user_comment_rating do
    value { 1 }
    comment { nil }
    user { nil }
  end
end
