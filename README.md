# テーブル設計

## usersテーブル

| Column                | Type       | options                   |
| --------------------- | ---------- | ------------------------- |
| nick_name             | string     | null: false               |
| email                 | string     | null: false, unique: true |
| password              | string     | null: false               |
| encrypted_password    | string     | null: false               |
| last_name             | string     | null: false               |
| first_name            | string     | null: false               |
| last_name_kana        | string     | null: false               |
| first_name_kana       | string     | null: false               |
| birth_date            | date       | null: false               |


### Association

- has_many :item_users
- has_many :items, through: user_items

## itemsテーブル

| Column        | Type    | options                        |
| ------------- | ------- | -----------                    |
| item          | string  | null: false                    |
| description   | text    | null: false                    |
| category_id   | integer | null: false, foreign_key: true |
| status_id     | integer | null: false, foreign_key: true |
| subscriber_id | integer | null: false, foreign_key: true |
| region_id  | integer | null: false, foreign_key: true |
| area_id       | integer | null: false, foreign_key: true |
| lead_time_id  | integer | null: false, foreign_key: true |
| price         | integer | null: false                    |

### Association

- has_many :item_users
- has_many :users, through: user_items

## user_itemsテーブル

| Column | Type       | options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchasesテーブル

| Column        | Type       | options                        |
| ------        | ---------- | ------------------------------ |
| approbalcode  | integer    | null: false                    |
| postalcode    | integer    | null: false                    |
| region        | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building_name | string     |                                |
| tel           | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
