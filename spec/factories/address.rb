FactoryBot.define do

  factory :address do
    postal_code      { "123-456"}
    prefectures      {"東京都"}
    city             {"八王子市"}
    address          {"3-12-4"}
    building_name    {"フォンティス八王子4F"}
    user_id          {"1"}
    phone_number     {"1111111111"}
  end

end