FactoryBot.define do
    factory :task do
        title { Faker::Name.first_name }
        estimated_hour { Faker::Number.number }
    end
end
