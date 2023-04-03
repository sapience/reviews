FactoryBot.define do
  factory :product do
    name { FFaker::Name.name }
    description { FFaker::Lorem.paragraph }
    overall_rating { rand(0.0..5.0) }
  end
end
