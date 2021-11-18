# テーブル設計

## users テーブル

| Column                   | Type   | Options     |
| ------------------------ | ------ | ----------- |
| nickname                 | string | null: false |
| email                    | string | null: false |
| encrypted_password       | string | null: false |
| real_first_name_kanji    | string | null: false |
| real_last_name_kanji     | string | null: false |
| real_first_name_katakana | string | null: false |
| real_last_name_katakana  | string | null: false |
| birth_date               | date   | null: false |

### Association

- has_many :items



## items テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| item_name         | string | null: false |
| explanation       | text   | null: false |
| category          | string | null: false |
| condition         | string | null: false |
| delivery_fee_load | string | null: false |
| ship_from_address | string | null: false |
| ship_to_duration  | string | null: false |
| price             | number | null: false |

### Association

- belongs_to :user