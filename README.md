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
  ![トップページの検索結果](https://github.com/SC-shunemuk/gurubuy/blob/master/images/7dfcf5111c4fecfee0dbbfd1de67db5d.png)  
  トップページでカテゴリー検索をマスクで行った結果です。
  
  ### 商品の詳細画面
  ![詳細画面](https://github.com/SC-shunemuk/gurubuy/blob/master/images/Animated%20GIF-downsized.gif)  
  商品の詳細画面で配達方法等が確認できて、ユーザー登録者であれば商品に対して質問が出来ます。また、出品者以外の場合は購入の画面に進むことが出来ます。
  
  ### 商品購入画面
  ![商品購入画面](https://github.com/SC-shunemuk/gurubuy/blob/master/images/Animated%20GIF-downsized%20(1).gif)  
  購入画面で配送先を入力後、購入者を集めるためにTwitterで共有が出来ます。
  
  ### マイページ
  ![商品決済画面](https://github.com/SC-shunemuk/gurubuy/blob/master/images/Animated%20GIF-downsized%20(2).gif)  
  マイページで出品した商品と購入者が集まり決済を待っている商品が一覧で確認出来ます。また、決済待ちの商品をクリックすることでクレジット決済の画面に推移出来ます。

# 工夫したポイント
  ・商品購入者を集めるためにSNS(Twitter)を利用し、twitterにログインすればgurubuyで用意されたテンプレートでツイートが出来る点  
  ・共同購入機能で購買意欲を高めるために商品購入者が集まった場合の金額を明示した点  
  ・商品を購入しやすいように詳細画面で質問が出来るようにした点  

# 使用技術(開発環境)
  ### バックエンド
  Ruby on Rails  

  ### フロントエンド
  Javascript  

  ### データベース
  MySQL, Sequel Pro  

  ### インフラ
  AWS(EC2)  

  ### WEBサーバ(本番環境)
  nginx  

  ### アプリケーションサーバ(本番環境)
  unicorn  

  ### ソース管理
  GitHub, GitHubDesktop  

  ### テスト
  RSpec  

  ### エディタ
  VSCode  
 
# 実装予定  
  ・商品の購入希望を複数出せるようにする  
  ・決済待ちの商品がある場合にトップページで通知が来るようにする  

# データベース設計
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

