# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| real_name_kanji    | string | null: false |
| real_name_katakana | string | null: false |
| birth_year         | number | null: false |
| birth_month        | number | null: false |
| birth_day          | number | null: false |

### Association

- has_many :items