# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| nickname           | text    | null: false  |
| email              | string  | unique: true |
| encrypted_password | string  | null: false  |
| last-name          | text    | null: false  |
| first-name         | text    | null: false  |
| last-name-kana     | text    | null: false  |
| first-name-kana    | text    | null: false  |
| birth-date         | integer | null: false  |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| image              | text       | null: false                    |
| info               | string     | null: false                    |
| sales-status       | string     | null: false                    |
| shipping-fee       | text       | null: false                    |
| prefecture         | text       | null: false                    |
| scheduled-delivery | text       | null: false                    |
| price              | text       | null: false                    |
| seller             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | references | null: false, foreign_key: true |
| image         | references | null: false, foreign_key: true |
| price         | references | null: false, foreign_key: true |
| shipping-fee  | references | null: false, foreign_key: true |
| payment-price | references | null: false, foreign_key: true |
| card-number   | integer    | null: false                    |
| exp-month     | integer    | null: false                    |
| exp-year      | integer    | null: false                    |
| card-cvc      | integer    | null: false                    |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :buyer

## buyers テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal-code  | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| address      | string  | null: false |
| building     | string  |             |
| phone-number | integer | null: false |

### Association

- belongs_to :order