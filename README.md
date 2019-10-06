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

