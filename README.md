テーブル設計

## usersテーブル

|     Column           | Type         | Options                   |
|----------------------|--------------|---------------------------|
| nickname             | string       | null: false               |
| email                | string       | null: false, unique: true |
| encrypted_password   | string       | null: false               |
| last_name            | string       | null: false               |
| first_name           | string       | null: false               |
| kana_last_name       | string       | null: false               |
| kana_first_name      | string       | null: false               |
| birthday             | date         | null: false               |



### Association


- has_many :items   ##itemsテーブルとのアソシエーション
- has_one :order ##購入テーブルとのアソシエーション

## itemsテーブル

|    Column            | Type         | Options                    |
|----------------------|--------------|----------------------------|
|                      |              |                            |
| name                 | string       | null: false                |
| explanation          | text         | null: false                |
| category_id          | integer      | null: false                |
| quality_id           | integer      | null: false                |
| shipping_charge_id   | integer      | null: false                |
| delivery_source_id   | integer      | null: false                |
| delivery_day_id      | integer      | null: false                |
| selling_price        | integer      | null: false                |
| user                 | references   | foreign_key: true          |


### Association 

-belongs_to :user
-has_one :order

## orderテーブル(購入テーブル)

|   Column            |  Type        |  Options                    |
|---------------------|--------------|-----------------------------|
| user                | references   | foreign_key: true           |
| item                | references   | foreign_key: true           |


### Association

-belongs_to :user
-belongs_to :item
-has_one :order_address


## order_address 

|  Column             |  Type        |  Options                    |
|---------------------|--------------|-----------------------------|
| postal_code         | string       | null: false                 |
| delivery_source_id  | integer      | null: false                 |
| municipalities      | string       | null: false                 |
| address             | string       | null: false                 |
| building_name       | string       |                             |
| telephone_number    | string       | null: false                 |
| order               | references   | foreign_key: true           |


### Association 

-belongs_to :order



