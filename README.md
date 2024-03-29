# README

## usersテーブル

|Column             |Type  |Options    |
|-------------------|------|-----------|
|nickname           |string|null: false|
|email              |string|null: false, unique: true|
|encrypted_password |string|null: false|
|first_name         |string|null: false|
|last_name          |string|null: false|
|first_name_kana   |string|null: false|
|last_name_kana    |string|null: false|
|birthday           |date  |null: false|

### Association
has_many: items
has_many: orders


## itemsテーブル

|Column          |Type      |Options          |
|----------------|----------|-----------------|
|item_name       |string    |null: false      |
|explanation     |text      |null: false      |
|category_id     |integer   |null: false      |
|condition_id    |integer   |null: false      |
|postage_id      |integer   |null: false      |
|prefecture_id   |integer   |null: false      |
|delivery_day_id |integer   |null: false      |
|price           |integer   |null: false      |
|user            |references|null: false, foreign_key: true|

### Association
has_one: order
belongs_to: user


## addressesテーブル

|Column          |Type     |Options            |
|----------------|---------|-------------------|
|postal_code     |string   |null: false        |
|prefecture_id   |integer  |null: false        |
|city            |string   |null: false        |
|street          |string   |null: false        |
|building        |string   |                   |
|phone_number    |string   |null: false        |
|order           |references|null: false, foreign_key: true  |

### Association
belongs_to: order


## ordersテーブル

|Column          |Type        |Options                         |
|----------------|------------|--------------------------------|
|user            |references  |null: false, foreign_key: true  |
|item            |references  |null: false, foreign_key: true  |


### Association
has_one: address
belongs_to: item
belongs_to: user


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
