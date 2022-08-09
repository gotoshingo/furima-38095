FactoryBot.define do
  factory :record_address do
    token {"tok_abcdefghijk00000000000000000"}
    address_number       { '123-4567' }
    item_address_id   { 2 }
    address_city            { '東京都' }
    address_house           { '葛飾区1-1' }
    address_building { '東京ハイツ' }
    phone_number           { '09012345678' }

  end
end