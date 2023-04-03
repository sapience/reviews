FactoryBot.define do
  factory :review do
    reviewer_name { FFaker::Name.name }
    written_review { FFaker::Lorem.paragraph }
    rating { rand(1..5) }

    association :product
  end
end
