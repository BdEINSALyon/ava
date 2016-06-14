FactoryGirl.define do
  factory :member do
    name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    birthday {Faker::Date.birthday 17, 25}
    email {"#{first_name.to_s.downcase}.#{name.to_s.downcase}+test@insa-lyon.fr"}
    phone {Faker::PhoneNumber.cell_phone}
    gender {%w(M W).sample}
  end
end
