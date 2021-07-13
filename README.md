# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth              | date    | null: false |

## itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        |            | null: false                    |
| name         | string     | null: false                    |
| text         | text       | null: false                    |
| category     | string     | null: false                    |
| state        | string     | null: false                    |
| shipping_fee | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| shipping_day | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

## buysテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| credit  | integer    | null: false                    |
| address | string     | null: false                    |
| phone   | string     | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |