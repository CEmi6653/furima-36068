FactoryBot.define do
  factory :donation_address do
    postal_code { '123-4567' }
    delivery_source_id { 1 }
    municipalities { '新宿' }
    address { '1-1' }
    building_name { '徳重ハウス' }
    telephone_number { '0123456789' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end