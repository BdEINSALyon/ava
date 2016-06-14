FactoryGirl.define do
  factory :membership do
    name 'VA'
    description 'Adhesion VA'
    price {rand 30}
    active true
  end
end
