FactoryBot.define do
  factory :purchase_address do
    postal_code              {"211-0068"}
    shipping_origin_id       {3}
    city                     {"川崎市"}
    address                  {"番地"}
    building_name            {"建物名"}
    phone_number             {"09012345678"}
    token                    {"tok_abcdefghijk00000000000000000"} 
  end
end
