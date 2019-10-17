FactoryBot.define do

  factory :address do
    post_code {"111-1111"}
    prefecture {"宮城県"}
    town {"仙台市青葉区"}
    street {"1-1-1"}
    building_name {"パルコ2"}
    user
  end

end
