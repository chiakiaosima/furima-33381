# テーブル設計

## usersテーブル

| Column                | Type       | options                   |
| --------------------- | ---------- | ------------------------- |
| nick_name             | string     | null: false               |
| email                 | string     | null: false, unique: true |
| encrypted_password    | string     | null: false               |
| last_name             | string     | null: false               |
| first_name            | string     | null: false               |
| last_name_kana        | string     | null: false               |
| first_name_kana       | string     | null: false               |
| birth_date            | date       | null: false               |


### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column        | Type       | options                        |
| ------------- | ---------- | ------------------------------ |
| product_name          | string     | null: false                    |
| description   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| subscriber_id | integer    | null: false                    |
| region_id     | integer    | null: false                    |
| lead_time_id  | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_one    :purchase
- belongs_to :user

## purchasesテーブル

| Column  | Type       | options     |
| ------- | ---------- | ----------- |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresssテーブル

| Column        | Type       | options                        |
| ------        | ---------- | ------------------------------ |
| postalcode    | string     | null: false                    |
| region_id     | integer    | null: false                    |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building_name | string     |                                |
| tel           | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to: purchase