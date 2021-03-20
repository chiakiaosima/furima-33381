# テーブル設計

## usersテーブル

| Column                | Type       | options                        |
| --------------------- | ---------- | ------------------------------ |
| nick_name             | string     | null: false                    |
| email                 | string     | null: false                    |
| password              | string     | null: false                    |
| password_confirmation | string     | null: false                    |
| last_name             | string     | null: false                    |
| first_name            | string     | null: false                    |
| last_name_kana        | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| year                  | references | null: false, foreign_key: true |
| month                 | references | null: false, foreign_key: true |
| day                   | references | null: false, foreign_key: true |

### Association

- has_many :item_users
- has_many :items, through: user_items
- has_one  :calendars

## itemsテーブル

| Column      | Type       | options                        |
| ----------- | ---------- | -----------                    |
| item        | string     | null: false                    |
| description | text       | null: false                    |
| category    | references | null: false, foreign_key: true |
| status      | references | null: false, foreign_key: true |
| subscriber  | references | null: false, foreign_key: true |
| ship_base   | references | null: false, foreign_key: true |
| area        | references | null: false, foreign_key: true |
| lead_time   | references | null: false, foreign_key: true |
| price       | integer    | null: false                    |

### Association

- has_many :item_users
- has_many :users, through: user_items
- has_one    :shipping_details

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
| creditcard    | integer    | null: false                    |
| expmonth      | integer    | null: false                    |
| expyear       | integer    | null: false                    |
| approbalcode  | integer    | null: false                    |
| postalcode    | integer    | null: false                    |
| region        | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building_name | string     | null: false                    |
| tel           | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :regions

## calendarsテーブル

| Column | Type    | options                        |
| ------ | ------- | ------------------------------ |
| year   | integer | null: false, foreign_key: true |
| mouth  | integer | null: false, foreign_key: true |
| day    | integer | null: false, foreign_key: true |

### Association

- belongs_to :user

## shipping_detailsテーブル

| Column     | Type   | options                        |
| ---------- | ------ | ------------------------------ |
| category   | string | null: false, foreign_key: true |
| status     | string | null: false, foreign_key: true |
| subscriber | string | null: false, foreign_key: true |
| ship_base  | string | null: false, foreign_key: true |
| area       | string | null: false, foreign_key: true |
| lead_time  | string | null: false, foreign_key: true |

### Association

- belongs_to :item

## regionsテーブル

| Column | Type   | options                        |
| ------ | ------ | ------------------------------ |
| region | string | null: false, foreign_key: true |

### Association

- belongs_to :purchases