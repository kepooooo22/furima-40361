# README

## usersテーブル

|Column          |Type  |Options    |
|----------------|------|-----------|
|nickname        |string|null: false|
|email           |string|null: false|
|password        |string|null: false|
|first_name      |string|null: false|
|last_name       |string|null: false|
|first_name(kana)|string|null: false|
|last_name(kana) |string|null: false|
|birthday        |date  |null: false|

### Association
has_one: address
has_many: items
has_many: orders


## itemsテーブル

|Column          |Type     |Options          |
|----------------|---------|-----------------|
|item_name       |string   |null: false      |
|explanation     |text     |null: false      |
|category        |integer  |null: false      |
|condition       |integer  |null: false      |
|postage         |integer  |null: false      |
|region          |integer  |null: false      |
|shipping_date   |integer  |null: false      |
|price           |string   |null: false      |
|user_id         |reference|foreign_key: true|

### Association
has_one: order
belongs_to: user


## addressesテーブル

|Column          |Type     |Options            |
|----------------|---------|-------------------|
|postal_code     |string   |null: false        |
|prefecture      |integer  |null: false        |
|city            |string   |null: false        |
|street          |string   |null: false        |
|building        |string   |                   |
|phone_number    |string   |null: false        |
|user_id         |reference|foreign_key: true  |

### Association
has_one: order
belongs_to: user



## ordersテーブル

|Column          |Type       |Options            |
|----------------|-----------|-------------------|
|user_id         |reference  |foreign_key: true  |
|item_id         |reference  |foreign_key: true  |
|address_id      |reference  |foreign_key: true  |


### Association
belongs_to: address
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
