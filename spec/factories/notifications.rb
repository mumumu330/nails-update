FactoryBot.define do
  factory :notification do
    visiter_id { 1 }
    visited_id { 1 }
    post_image_id { 1 }
    post_comment_id { 1 }
    action { "MyString" }
    checked { false }
  end
end
