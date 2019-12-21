FactoryBot.define do
  factory :user do
    email {"g64@gmail.com"}
    password {"g64g64g64"}
    last_name {"田中"}
    fast_name {"太郎"}
    last_name_kana {"タナカ"}
    fast_name_kana {"タロウ"}
    birth_year {2019}
    birth_month {12}
    birth_day {12}
    nickname {"g64"}
    phone_number {"1111111111"} 
  end

  factory :buyer, class: User do
    # user_id {1}
    email {"buyer@gmail.com"}
    password {"buyerbuyer"}
    last_name {"田中"}
    fast_name {"太郎"}
    last_name_kana {"タナカ"}
    fast_name_kana {"タロウ"}
    birth_year {2019}
    birth_month {12}
    birth_day {12}
    nickname {"g64"}
    phone_number {"1111111111"} 
    created_at {2010/12/3}
    updated_at {2010/12/4}
    delete_flg {0}
  end
  factory :seler, class: User do
    # user_id {1}
    email {"seler@gmail.com"}
    password {"sele1rseler"}
    last_name {"田中"}
    fast_name {"太郎"}
    last_name_kana {"タナカ"}
    fast_name_kana {"タロウ"}
    birth_year {2019}
    birth_month {12}
    birth_day {12}
    nickname {"g64"}
    phone_number {"1111111111"} 
    created_at {2010/12/3}
    updated_at {2010/12/4}
    delete_flg {0}
    seler_id { 1 }
  end
end
