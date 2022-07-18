# README

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| second_name        | string              | null: false               |
| first_name_kana    | string              | null: false               |
| second_name_kana   | string              | null: false               |
| nick_name          | string              | null: false               |
| date_of_birth      | date                | null: false               |

### Association

- has_many :items
- has_many :buys

## address table

| Column                 | Type                | Options                             |
|------------------------|---------------------|-------------------------------------|
| address_number         | string              | null: false                         |
| address_prefectures    | integer             | null: false                         |
| address_city           | integer             | null: false                         |
| address_house          | string              | null: false                         |
| address_building       | text                |                                     |
| phone_number           | string              | null: false                         |
| buy                    | references          | null: false, foreign_key: true      |

### Association

- belongs_to :buy

## items table

| Column                 | Type                | Options                            |
|------------------------|---------------------|------------------------------------|
| item_name              | string              | null: false                        |
| item_category_id       | integer             | null: false                        |
| item_condition_id      | integer             | null: false                        |
| item_address_id        | integer             | null: false                        |
| item_explanation_id    | integer             | null: false                        |
| delivery_category_id   | integer             | null: false                        |
| delivery_dey_id        | integer             | null: false                        |
| price                  | integer             | null: false                        |
| user                   | references          | null: false, foreign_key: true     |

### Association

- belongs_to :user
- belongs_to :buy

## buys table

| Column             | Type                | Options                            |
|--------------------|---------------------|------------------------------------|
| item               | references          | null: false, foreign_key: true     |
| user               | references          | null: false, foreign_key: true     |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address