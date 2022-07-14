# README

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| second_name        | string              | null: false               |
| nick_name          | string              | null: false               |
| date_of_birth      | date                | null: false               |

### Association

- has_many :items
- has_many :buys
- has_one :address

## address table

| Column                 | Type                | Options                   |
|------------------------|---------------------|---------------------------|
| address_number         | text                | null: false               |
| address_prefectures    | text                | null: false               |
| address_city           | text                | null: false               |
| address_house          | text                | null: false               |
| address_building       | text                |                           |
| phone_number           | text                | null: false               |
| card_number            | string              | null: false               |
| card_dey               | string              | null: false               |
| card_security          | string              | null: false               |

### Association

- has_one :items
- belongs_to :users

## items table

| Column                 | Type                | Options                            |
|------------------------|---------------------|------------------------------------|
| item_image             | text                | null: false                        |
| item_name              | text                | null: false                        |
| item_category          | text                | null: false                        |
| item_condition         | text                | null: false                        |
| item_address           | text                | null: false                        |
| item_explanation       | text                | null: false                        |
| delivery_category      | string              | null: false                        |
| price                  | string              | null: false                        |
| user                   | references          | null: false, foreign_key: true     |

### Association

- belongs_to :users
- belongs_to :address
- has_one :buys

## buys table

| Column             | Type                | Options                            |
|--------------------|---------------------|------------------------------------|
| item               | references          | null: false, foreign_key: true     |
| user               | references          | null: false, foreign_key: true     |

### Association

belongs_to :users
belongs_to :buys