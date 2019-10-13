FactoryBot.define do

  factory :product do
    name {"やかん"}
    discription {"やかんです"}
    condition {"未使用に近い"}
    delivery_charge {"出品者"}
    origin_area {"宮城県"}
    days_left_send {"1~2日"}
    price {"1000"}
    status {"出品中"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end

end