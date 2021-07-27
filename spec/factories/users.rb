FactoryBot.define do
  factory  :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    birthday { Faker::Date.backward}
    last_name {'田中'}
    first_name {'清'}
    kana_last_name{'タナカ'}
    kana_first_name{'キヨシ'}
  end

end