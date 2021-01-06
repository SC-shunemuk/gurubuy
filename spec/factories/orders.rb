FactoryBot.define do
  factory :order do
    address_code        { "102-4321" }
    city                { "豊島区北池袋" }
    address_number      {Faker::Address.street_address}
    tel                 { "09048579303" }
    prefecture_id       { 2 }
    house_name          {Faker::Address.street_name}
    association :user
    association :item
  end
end
