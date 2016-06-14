FactoryGirl.define do
  factory :subscription do
    add_attribute(:method) { %w(EMV ESP CHQ).sample }
  end
end
