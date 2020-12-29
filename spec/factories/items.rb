FactoryBot.define do
  factory :item do
    image               { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/anomaly-602401.png')) }
    name                { Faker::Name.initials(number: 2) }
    content             { Faker::Lorem.sentence }
    price               { 450 }
    category_id         { 2 }
    joint_buying_id     { 2 }
    shipping_method_id  { 2 }
    prefecture_id       { 2 }
    association :user
  end
end
