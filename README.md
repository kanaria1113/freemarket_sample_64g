# README　このアプリについて
***

## Fmarket（メルカリコピーサイト）とは
プログラミングスクールTECH::EXPERT64期最終課題制作物。
スクラム（チーム4人）によるアジャイル開発により制作。
メルカリの機能である新規会員登録・ログイン機能・商品出品機能・商品購入機能・商品編集機能などを忠実に再現した。

## アプリケーション概要
* アプリ名：Fmarket
* 使用言語：HTML/CSS/Ruby/Rails/JavaScript/jQuery/MySQL/AWS/Github/Visual Studio Code
* 機能：新規会員登録・ログイン機能・商品出品機能・商品購入機能・商品編集機能・パンくず機能
* 作業人数：4人
* 作業期間：約4週間
* タスク管理：Trello

### URL：[http://18.176.84.42/](http://18.176.84.42/)

Basic認証をかけています。閲覧時は以下のIDとPassを入力してください。
### lock:ID&Pass
* ID: f-g64
* Pass:9898

## テスト用アカウント

### 購入者アカウント
* メール：buy@gmail.com
* パスワード: a123456

### 購入用カード情報
* 番号：4242424242424242
* 期限：01/21
* セキュリティコード：123

### 出品者用アカウント
* メール：sell@gmail.com
* パスワード：seller_user ※本番環境ではFacebook/Googleでのログインはできませんのでご了承ください




## usersテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|fast_name|string|null: false|
|last_name_kana|string|null: false|
|fast_name_kana|string|null: false|
|mail_address|string|null: false,unique: true|
|password|string||references||
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|nickname|string|null: false|
|profile|text||
|created_at|datetime|null: false|
|updated_at|timestamp|null: false|
|delete_flg|boolean|null: false|
|image|string||
### Association
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :to_do_lists, dependent: :destroy
- has_many :evaluations, dependent: :destroy
- has_many :notices, through: :users_notice
- has_one :card, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :notifications, dependent: :destroy

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|adderess|string|null: false|
|building_name|string||
### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|genre_id|references|null: false, foreign_key: true|
|image_id|references|null: false, foreign_key: true|
|name|string|null: false|
|status|string|null: false|
|size|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|burden|string|null: false|
|method|string|null: false|
|region|string|null: false|
|date|string||
|created_at|datetime|null: false|
|updated_at|timestamp|null: false|
|delete_flg|boolean|null: false|
|buyer_id|references|foreign_key: { to_table: :users }|
|seler_id|references|null: false, foreign_key: { to_table: :users }|
### Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :likes
- has_many :images, dependent: :destroy
- has_many :categorys, through: items_categorys
- belongs_to :brand
- has_one :seller_evaluation
- has_one :buyer_evaluation

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :items, through: items_categorys

## items_categorysテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :category

## genreテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|name|string|null: false|
|ancestry|integer|null: false|
### Association
- has_many :items
- has_many :brands, through: genres_brands

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string|null: false|
### Association
- has_many :items
- has_many :genres, through: genres_brands

## genres_brandsテーブル
|Column|Type|Options|
|------|----|-------|
|gnere_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
### Association
- belongs_to :genre
- belongs_to :brand

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|url|text|null: false|
### Association
- belongs_to :item

## notificationsテーブル
|Column|Type|Options|
|------|----|-------|
|visitor_id|references|null: false, foreign_key: { to_table: :users }|
|visited_id|references|null: false, foreign_key: { to_table: :users }|
|item_id|references|null: false, foreign_key: { to_table: :items }|
|comment_id|references|null: false, foreign_key: { to_table: :comments }|
|action|string|null: false|
|checked|boolean|null: false, default: false|
### Association
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## to_do_listテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|list|text|null: false|

### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## noticesテーブル
|Column|Type|Options|
|------|----|-------|
|notice|text|null: false|
|user_id|references|null: false, foreign_key: true|


### Association
- has_many :users, through: :users_notices

## users_noticesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|notice_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :notice

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|integer|null: false|
|comment|text||

### Association
- belongs_to :user


## cardテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|expiration|integer|null: false|
|name|string|null: false|
|cvc|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
i