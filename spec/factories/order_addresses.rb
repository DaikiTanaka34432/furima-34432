FactoryBot.define do
  factory :order_address do
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'渋谷区'}
    house_number {'渋谷1-1'}
    house_name {'テックハウス101'}
    telephone {'09012345678'}
  end
end
