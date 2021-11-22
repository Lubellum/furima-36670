# テーブル設計

## users テーブル

| Column                  | Type      | Options                        |
| ----------------------- | --------- | ------------------------------ |
| nickname                | string    | null: false                    |
| email                   | string    | null: false, unique: true      |
| encrypted_password      | string    | null: false                    |
| first_name_kanji        | string    | null: false                    |
| last_name_kanji         | string    | null: false                    |
| first_name_katakana     | string    | null: false                    |
| last_name_katakana      | string    | null: false                    |
| birth_date              | date      | null: false                    |

### Association

- has_many :items
- has_many :purchase＿records



## items テーブル

| Column                  | Type      | Options                        |
| ----------------------- | --------- | ------------------------------ |
| item_name               | string    | null: false                    |
| explanation             | text      | null: false                    |
| category_id             | integer   | null: false, foreign_key: true |
| condition_id            | integer   | null: false, foreign_key: true |
| delivery_fee_payment_id | integer   | null: false, foreign_key: true |
| ship_from_address_id    | integer   | null: false, foreign_key: true |
| ship_to_duration_id     | integer   | null: false, foreign_key: true |
| price                   | integer   | null: false                    |
| user                    | references | null: false                    |

### Association

- belongs_to :user
- has_one :purchase＿records



## purchase＿records テーブル

| Column                  | Type      | Options                        |
| ----------------------- | --------- | ------------------------------ |
| user                    | references | null: false                    |
| item                    | references | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :mailing_address



## mailing_address テーブル

| Column                  | Type      | Options                        |
| ----------------------- | --------- | ------------------------------ |
| postal_code             | string    | null: false                    |
| prefectures             | integer   | null: false                    |
| municipalities          | string    | null: false                    |
| street_number           | string    | null: false                    |
| building_name           | string    |                                |
| telephone_number        | string    | null: false                    |
| user                    | references | null: false                    |
| item                    | references | null: false                    |

### Association

- belongs_to :purchase＿records