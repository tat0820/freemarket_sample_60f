FactoryBot.define do

  factory :product do
    # id {"1"}
    name {"おーいお茶"}
    discription {"美味しいお茶です"}
    condition {"未使用に近い"}
    delivery_charge {"送料込み(出品者負担)"}
    origin_area {"宮城県"}
    days_left_send {"1~2日で発送"}
    price {"1000"}
    status {"出品中"}
    # created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end