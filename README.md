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
| Column    | Type    | Options     |
| --------- | ------  |------------ |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| user_name | string  | null: false |
| name_read | string  | null: false |
| birthday  | integer | null: false |

### Association
has_many :items
has_many :purchases


## items テーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- |-------------------------------- |
| name             | string     | null: false                     |
| profile          | string     | null: false                     |
| category         | string     | null: false                     |
| status           | string     | null: false                     |
| delivery_fee     | string     | null: false                     |
| shipment_sources | string     | null: false                     |
| shipment_days    | integer    | null: false                     |
| fee              | integer    | null: false                     |
| profit           | integer    | null: false                     |
| user             | references | null: false, foreign_keys: true |

### Association
has_one :purchase
belongs_to :user

## purchases テーブル
| Column           | Type       | Options                         |
| ---------------- | ---------  |-------------------------------- |
| credit_card      | integer    | null: false                     |
| shipment_address | string     | null: false                     |
| telephone        | integer    | null: false                     |
| item             | references | null: false, foreign_keys: true |
| user             | references | null: false, foreign_keys: true |


### Association
belongs_to :user
belongs_to :item

