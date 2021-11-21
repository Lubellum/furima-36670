# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name_kanji    | string | null: false               |
| last_name_kanji     | string | null: false               |
| first_name_katakana | string | null: false               |
| last_name_katakana  | string | null: false               |
| birth_date          | date   | null: false               |

### Association

- has_many :items
- has_many :purchase＿records



## items テーブル

| Column               | Type    | Options                        |
| -------------------- | ------- | ------------------------------ |
| item_name            | string  | null: false                    |
| explanation          | text    | null: false                    |
| category             | integer | null: false, foreign_key: true |
| condition            | integer | null: false, foreign_key: true |
| delivery_fee_payment | integer | null: false, foreign_key: true |
| ship_from_address    | integer | null: false, foreign_key: true |
| ship_to_duration     | integer | null: false, foreign_key: true |
| price                | integer | null: false                    |

### Association

- belongs_to :user
- has_many :purchase＿records



## purchase＿records テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| user_id | string | null: false |
| item_id | string | null: false |

### Association

- belongs_to :user
- belongs_to :item



## mailing_address テーブル

| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| postal_code      | int    | null: false |
| prefectures      | string | null: false |
| municipalities   | string | null: false |
| street_number    | int    | null: false |
| building_name    | string |             |
| telephone_number | int    | null: false |

### Association

has_one :user
has_one :item