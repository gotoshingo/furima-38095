FactoryBot.define do
  factory :user do
    nick_name              {'abe'}
    email                 {'kkk@gmail.com'}
    password              {'abc123'}
    password_confirmation {password}
    first_name        {'太郎'}
    second_name       {'田中'}
    first_name_kana   {'タロウ'}
    second_name_kana  {'タナカ'}
    date_of_birth     {'2001-12-11'}
  end
end