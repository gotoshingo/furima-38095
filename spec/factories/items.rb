FactoryBot.define do
  factory :item do
    item_name         {Faker::Lorem.characters(number: 40)}
    item_explanation       {Faker::Lorem.characters(number: 50)}
    item_category_id      {Faker::Number.between(from: 2, to: 11)}
    item_condition_id  {Faker::Number.between(from: 2, to: 6)}
    delivery_category_id        {Faker::Number.between(from: 2, to: 3)}
    item_address_id {Faker::Number.between(from: 2, to: 48)}
    delivery_dey_id   {Faker::Number.between(from: 2, to: 4)}
    price         {Faker::Number.between(from: 300, to: 9999999)}
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
