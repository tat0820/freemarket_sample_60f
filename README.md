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
