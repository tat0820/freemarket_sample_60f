crumb :root do
  link "メルカリ", root_path
end

crumb :user_show do 
  link "マイページ", user_path
  parent :root
end

crumb :user_edit do 
  link "プロフィール"
  parent :user_show
end

crumb :credit do 
  link "支払い方法"
  parent :user_show
end

crumb :add_credit do
  link "クレジットカード情報入力"
  parent :credit
end

crumb :user_check do
  link "本人情報" 
  parent :user_show
end

crumb :logout do 
  link "ログアウト"
  parent :user_show
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).