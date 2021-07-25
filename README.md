テーブル設計

## usersテーブル

|     Column           | Type         | Options               |
|----------------------|--------------|-----------------------|
| name                 | string       | null: false           |
| email                | string       | null: false           |
| encrypted_password   | string       | null: false           |
| last_name            | string       | null: false           |
| first_name           | string       | null: false           |
| kana_last_name       | string       | null: false           |
| kana_first_name      | string       | null: false           |
| year                 | string       | null: false           |
| moth                 | string       | null: false           |
| day                  | string       | null: false           |


### Association


- has_many :items   ##itemsテーブルとのアソシエーション
- has_one :purchase ##購入テーブルとのアソシエーション

## itemsテーブル

|    Column            | Type         | Options                    |
|----------------------|--------------|----------------------------|
|                      |              |                            |
| item_name            | string       | null: false                |
| explanation          | text         | null: false                |
| category             | string       | null: false                |
| quality              | string       | null: false                |
| delivery_burden      | string       | null: false                |
| delivery_source      | string       | null: false                |
| delivery_days        | string       | null: false                |
| delivery_price       | string       | null: false                |
| user                 | reference    | 
 
## imageはアクティブストレージ??
## user foregn_key :true

### Association 

-belongs_to :user

## purchaseテーブル(購入テーブル)

|   Column            |  Type        |  Options                    |
|---------------------|--------------|-----------------------------|
| card_id             | string       | null: false                 |
| card_number         | string       | null: false                 |
| card_deadline       | string       | null: false                 |
| card_code           | string       | null: false                 |
| user                | reference    |
| shipping_address    | reference    | 


### Association

-belongs_to :user
-has_one :shipping_address


## shipping_address 

|  Column             |  Type        |  Options                    |
|---------------------|--------------|-----------------------------|
| postal_code         | string       | null: false                 |
| prefectures         | string       | null: false                 |
| municipalities      | string       | null: false                 |
| address             | string       | null: false                 |
| building_name       | string       | null: false                 |
| telephone_number    | string       | null: false                 |


### Association 

-belongs_to :purchase



