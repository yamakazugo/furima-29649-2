FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    birth_date            {Faker::Date.birthday}
    last_name             {"和剛"}
    first_name            {"山口"}
    last_name_kana        {"カズタカ"}
    first_name_kana       {"ヤマグチ"}
    email                 {Faker::Internet.free_email}
    password              {"000aaa"}
    password_confirmation {password}
  end
end
