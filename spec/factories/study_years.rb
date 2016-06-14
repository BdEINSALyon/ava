FactoryGirl.define do
  factory :study_year do
    year {rand(4)+1}
    name {"#{year}A"}
  end
end
