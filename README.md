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
| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_read     | string  | null: false               |
| first_name_read    | string  | null: false               |
| birthday           | date    | null: false               |

### Association
has_many :items
has_many :purchases


## items テーブル
| Column              | Type       | Options                         |
| ------------------- | ---------- |-------------------------------- |
| name                | string     | null: false                     |
| profile             | text       | null: false                     |
| category_id         | integer    | null: false                     |
| status_id           | integer    | null: false                     |
| delivery_fee_id     | integer    | null: false                     |
| prefecture_id       | integer    | null: false                     |
| shipment_days_id    | integer    | null: false                     |
| fee                 | integer    | null: false                     |
| user                | references | null: false, foreign_keys: true |

### Association
has_one :purchase
belongs_to :user

## purchases テーブル
| Column           | Type       | Options                         |
| ---------------- | ---------  |-------------------------------- |
| item             | references | null: false, foreign_keys: true |
| user             | references | null: false, foreign_keys: true |


### Association
belongs_to :user
belongs_to :item
has_one :address

## addresses
| Column            | Type       | Options                         |
| ----------------- | ---------  |-------------------------------- |
| postal_code       | string     | null: false                     |
| prefecture_id     | integer    | null: false                     |
| city              | string     | null: false                     |
| house_number      | string     | null: false                     |
| house_name        | string     |                                 |
| telephone         | string     | null: false                     |
| purchase          | references | null: false, foreign_keys: true |

### Association
belongs_to :purchase