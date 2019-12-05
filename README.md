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
|nickname|text|null: false|
|profile|text||
|card_id|references||
|created_at|datetime|null: false|
|updated_at|timestamp|null: false|
|delete_flg|boolean|null: false|
|image|string||
### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_many :to_do_lists
- belongs_to :evaluation
- has_many :notifications, through: :users_notification
- has_one :card
- has_one :address

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|adderess|string|null: false|
|building_name|text||
### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|category_id|references|null: false|
|brand_id|references||
|genre_id|references|null: false|
|image_id|references|null: false|
|like_id|references||
|name|text|null: false|
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
- belongs_to :comment
- has_many :likes
- has_many :images
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
|item_id|references|null: false|
|category_id|references|null: false|
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

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|item_id|references|null: false|

### Association
- has_many :users
- has_many :items

## to_do_listテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|list|text|null: false|

### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false foreign_key: true|
|item_id|references|null: false foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## notificationテーブル
|Column|Type|Options|
|------|----|-------|
|notification|text|null: false|
|user_id|references|null: false|
### Association
- has_many :users, through: :users_notifications

## users_notificationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|notification_id|references|null: false|
### Association
- belongs_to :user
- belongs_to :notification

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|integer|null: false|
|comment|text||
|user_id|references|null: false|

### Association
- has_many :users


## cardテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|expiration|integer|null: false|
|name|string|null: false|
|cvc|integer|null: false|

### Association
- belongs_to :user
