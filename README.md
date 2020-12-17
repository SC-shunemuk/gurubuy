# アプリケーション名　GURUBUY

### アプリケーションの概要：ログイン機能、商品の出品、購入  
### URL: https://gurubuy.herokuapp.com/  
### テスト用アカウント：  
### 利用方法：ユーザーのログイン→出品→購入者が集まる→決済完了  

## 目指した課題解決
  ・より安価に商品の購入ができること  
  ・ハンドメイド出品者に安定した収入が期待できること

## 洗い出した要件
  ・ユーザー管理機能（実装済み）  
  ・商品出品機能  （実装済み）
  ・商品共同購入機能  
  ・商品編集機能  (実装済み)
  ・商品に対してのコメント機能  
  ・商品の検索機能

## 実装した機能についてのGIFと説明

## 実装予定の機能  
  ・商品共同購入機能    
  ・商品に対してのコメント機能  
  ・商品の検索機能

## データベース設計
### usersテーブル
| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| encrypted_password| string | null: false |
| first_name        | string | null: false |
| last_name         | string | null: false |
| first_name_kana   | string | null: false |
| last_name_kana    | string | null: false |
| birth_date        | date   | null: false |

#### Association

has_many :items
has_many :purchases
has_many :comments
has_many :orders


### items
| Column             | Type    | Options           |
| ------------------ | ------- | ----------------- |
| name               | string  | null: false       |
| content            | text    | null: false       |
| price              | integer | null: false       |
| joint_buying_id    | integer | null: false       |
| exhibit_number     | integer |                   |
| category_id        | integer | null: false       |
| shipping_method_id | integer | null: false       |
| prefecture_id      | integer | null: false       |
| user               |reference| foreign_key: true |

#### Association

belongs_to :user
has_many   :comments
has_many   :purchases
has_many   :orders

### purchases
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user            |reference| null: false, foreign_key: true |
| item            |reference| null: false, foreign_key: true |

#### Association

belongs_to :user
belongs_to :item
belongs_to :order

### orders
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| address_code    | string  | null: false                    |
| prefecture_id   | integer | null: false                    |
| city            | string  | null: false                    |
| address_number  | string  | null: false                    |
| house_name      | string  |                                |
| tel             | string  | null: false, unique: true      |
| user            |reference| null: false, foreign_key: true |
| item            |reference| null:false, foreign_key: true  |

#### Association

belongs_to :user
belongs_to :item
has_one    :purchase

### comments
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| text            | text    | null: false                    |
| user            |reference| null: false, foreign_key: true |
| item            |reference| null: false, foreign_key: true |

#### Association

belongs_to :user
belongs_to :item

