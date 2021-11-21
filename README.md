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

| Column            | Type   | Options                        |
| ----------------- | ------ | ------------------------------ |
| item_name         | string | null: false                    |
| explanation       | text   | null: false                    |
| category          | string | null: false, foreign_key: true |
| condition         | string | null: false, foreign_key: true |
| delivery_fee_load | string | null: false, foreign_key: true |
| ship_from_address | string | null: false, foreign_key: true |
| ship_to_duration  | string | null: false, foreign_key: true |
| price             | int    | null: false                    |

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