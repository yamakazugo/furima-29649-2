FactoryBot.define do
  factory :item do
    name                     {"商品名"}
    info                     {Faker::Lorem.sentence}
    category_id              {3}
    sales_status_id          {3}
    shipping_fee_id          {3}
    prefecture_id            {3}
    schedule_delivery_id     {3}
    price                    {9999}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
