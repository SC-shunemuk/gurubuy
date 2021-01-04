# アプリ
  GURUBUY

# 概要
  ・登録を行ったユーザーが商品を出品したり、商品をクレジットカードを利用して購入をしたり出来る  
  ・商品をカテゴリー別に検索したり、キーワード検索を行ったりすることが出来る  
  ・商品を複数人で購入することでより安価にすることが出来る、また購入者を集めるためにすぐにTwitterで投稿出来る

# 本番環境 
  ## URL: http://13.230.135.253/

  ## 認証  
  ユーザー名：groupbuy  
  パスワード：guru111  
### テスト用アカウント：  
### 利用方法：ユーザーのログイン→出品→購入者の商品の申込→購入者が集まる→決済 

## 目指した課題解決
  ・より安価に商品の購入ができること  
  ・ハンドメイド出品者に安定した収入が期待できること

## 洗い出した要件
  ・ユーザー管理機能  
  ・商品出品機能  
  ・商品共同購入機能  
  ・商品編集機能  
  ・商品に対してのコメント機能  
  ・商品の検索機能  

## 実装した機能についてのGIFと説明

## 実装予定  
  ・商品の購入希望を複数出せるようにすること　　

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

