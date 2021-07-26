テーブル設計

## usersテーブル

|     Column           | Type         | Options               |
|----------------------|--------------|-----------------------|
| name                 | string       | null: false           |
| email                | string       | unique: true          |
| encrypted_password   | string       | null: false           |
| last_name            | string       | null: false           |
| first_name           | string       | null: false           |
| kana_last_name       | string       | null: false           |
| kana_first_name      | string       | null: false           |
| birthday             | date         | null: false           |



### Association


- has_many :items   ##itemsテーブルとのアソシエーション
- has_many :purchase ##購入テーブルとのアソシエーション

## itemsテーブル

|    Column            | Type         | Options                    |
|----------------------|--------------|----------------------------|
|                      |              |                            |
| name                 | string       | null: false                |
| explanation          | text         | null: false                |
| category             | string       | null: false                |
| quality_id           | integer      | null: false                |
| delivery_burden_id   | integer      | null: false                |
| delivery_source_id   | integer      | null: false                |
| delivery_days_id     | integer      | null: false                |
| delivery_price_id    | integer      | null: false                |
| selling_price        | string       | null: false                |
| user                 | reference    | foreign_key: true          |


### Association 

-belongs_to :user
-belongs_to :purchase

## purchaseテーブル(購入テーブル)

|   Column            |  Type        |  Options                    |
|---------------------|--------------|-----------------------------|
| user                | reference    | foreign_key: true           |
| item                | reference    | foreign_key: true           |


### Association

-belongs_to :user
-has_many :item
-has_one :shipping_address


## shipping_address 

|  Column             |  Type        |  Options                    |
|---------------------|--------------|-----------------------------|
| postal_code_id      | integer      | null: false                 |
| prefectures_id      | integer      | null: false                 |
| municipalities      | string       | null: false                 |
| address             | string       | null: false                 |
| building_name       | string       |                             |
| telephone_number    | string       | null: false                 |
| purchase            | reference    | foreign_key: true           |


### Association 

-belongs_to :purchase



