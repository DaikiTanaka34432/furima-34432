FactoryBot.define do
  factory :item do
    name {'abc123'}
    profile {'abcde12345'}
    category_id {2}
    status_id {2}
    delivery_fee_id {2}
    prefecture_id {2}
    shipment_days_id {2}
    fee {9999999}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename:'apple-touch-icon.png')
    end
  end
end
