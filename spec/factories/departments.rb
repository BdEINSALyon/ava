FactoryGirl.define do
  factory :department do
    name {%w(TC IF GI GE GM SGM BB BIM PC Ext).sample}
  end
end
