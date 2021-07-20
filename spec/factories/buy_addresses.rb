FactoryBot.define do
  factory :buy_address do
    zip_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_num { '1-1' }
    building { '東京ハイツ' }
    phone { '09012345678' }
  end
end
