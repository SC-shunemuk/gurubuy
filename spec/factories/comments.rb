FactoryBot.define do
  factory :comment do
    text     { Faker::Lorem.sentence }
    item_id  { 2 }
    user_id  { 2 }
  end
end
