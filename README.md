# README

# メルカリ DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false| <!--名前-->
|email|string|null: false| <!--メールアドレス-->
|password|string|null: false| <!--パスワード-->
|phone_number|integer|null: false| <!--電話番号-->
|post_code|integer|null: false| <!--郵便番号-->
|prefecture|string|null: false| <!--都道府県-->
|town|string|null: false| <!--市区町村-->
|address|integer|null: false| <!--番地-->
|building name|string|null: false| <!--建物名-->
|card_number|integer|| <!--クレジットカード番号-->
|exparation_date|integer|| <!--クレジットカード有効期限-->
|security_code|integer|| <!--セキュリティコード-->
|sales_money|string|null: false| <!--売上金-->
|point|string|null: false| <!--ポイント-->

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|　<!--商品名-->
|discription|text||　<!--商品説明-->  
|condition|string|null: false|　<!--商品の状態-->
|delivery_charge|string|null: false|　<!--配送料の負担-->
|origin_area|string|null: false|　<!--発送元の地域-->
|days_left_send|integer|null: false|　<!--発送までの日数-->
|price|integer|null: false|　<!--値段-->
|status|string|null: false|　<!--ステータス(出品中か取引中か売却済み)-->
|user_id|references|null: false, foreign_key: true|　<!--user_id-->

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|　<!--コメント-->
|user_id|references|null: false, foreign_key: true|　<!--user_id-->
|product_id|references|null: false, foreign_key: true|　<!--product_id-->

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|　<!--user_id-->
|product_id|references|null: false, foreign_key: true|　<!--product_id-->

## detailsテーブル
|Column|Type|Options|
|------|----|-------|
|large_category|string|null: false|　<!--大項目カテゴリー-->
|medium_category|string|null: false|　<!--中項目カテゴリー-->
|small_category|string|null: false|　<!--小項目カテゴリー-->
|size|string|null: false|　<!--サイズ-->
|brand|string|null: false|　<!--ブランド-->
|product_id|references|null: false, foreign_key: true|　<!--product_id-->

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|img|string|null: false|　<!--画像-->
|product_id|references|null: false, foreign_key: true|　<!--product_id-->

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|　<!--コメント-->
|user_id|references|null: false, foreign_key: true|　<!--user_id-->
|product_id|references|null: false, foreign_key: true|　<!--product_id-->

## soldoutsテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|　<!--product_id-->
|user_id|references|null: false, foreign_key: true|　<!--user_id-->
|buyer_id|references|null: false, foreign_key: { to_table: :users }|　<!--購入者-->

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|rank|integer|null: false, foreign_key: true|　<!--評価-->
|body|text||　<!--コメント-->
|user_id|references|null: false, foreign_key: true|　<!--user_id-->

## todosテーブル
|Column|Type|Options|
|------|----|-------|
|action|text|null: false|　<!--やること-->
|user_id|references|null: false, foreign_key: true|　<!--user_id-->

## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|　<!--フォローする人-->
|follow_id|references|null: false, foreign_key: { to_table: :users }|　<!--フォローされる人-->