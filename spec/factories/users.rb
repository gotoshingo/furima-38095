FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    nick_name              {Gimei.name }
    email                 {Faker::Internet.free_email}
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    first_name        {Gimei.name.first.kanji}
    second_name       {Gimei.name.last.kanji}
    first_name_kana   {Gimei.name.first.katakana}
    second_name_kana  {Gimei.name.last.katakana}
    date_of_birth     { Faker::Date.backward}
  end
end