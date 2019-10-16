FactoryBot.define do

  factory :user do
    id {"1"}
    nickname {"test"}
    email {"test@test"}
    password {"password"}
    password_confirmation {"password"}
    last_name {"佐藤"}
    first_name {"一郎"}
    last_name_kana {"サトウ"}
    first_name_kana {"イチロウ"}
    card_number {"11111111"}
    card_limit_year {"2020"}
    card_limit_month {"4"}
    security_code {"111"}
    birthday_year {"1995"}
    birthday_month {"12"}
    birthday_day {"31"}
    phone_number {"11111111"}

    after(:create) do |user|
      create(:address, user: user)
    end
  end

end
