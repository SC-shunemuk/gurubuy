# アプリ
  ## GURUBUY (ハンドメイドに重点を置いたフリマアプリ)

# 概要
  ・登録を行ったユーザーが商品を出品したり、商品をクレジットカードを利用して購入をしたり出来る  
  ・商品をカテゴリー別に検索したり、キーワード検索を行ったりすることが出来る  
  ・商品を複数人で購入することでより安価にすることが出来る、また購入者を集めるためにすぐにTwitterで投稿出来る

# 本番環境 
  ## http://13.230.135.253/

  ## 認証  
  ユーザー名：groupbuy  
  パスワード：guru111  

  ## テスト用アカウント
  Eメール: guru＠com  
  パスワード: sample1234  

# 制作背景（意図）  
  ハンドメイド商品の価格を少しでも安価にすること、ハンドメイドを趣味にしている方が副業と言えるくらいの収入を確保出来るようにすることの2点の課題解決をするために制作致しました。課題解決を行うのは共同購入機能です。商品購入者は、少しでも商品を安価にするために一緒に購入する人を集め、購入する人が集まり次第、決済をします。商品出品者は購入する人が複数いることで1つ売るより収入が多くなります。
  
# DEMO
  ### トップページ
  ![トップページ](https://github.com/SC-shunemuk/gurubuy/blob/master/images/c2a4e8f064fec562c7eb92ba789a0920.jpg)
  ### トップページ（カテゴリーにて検索結果）
  ![トップページの検索結果]()
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

