FactoryBot.define do
  factory :project do
      name {  Faker::Name.first_name }
      description {  Faker::Name.name  }
      start_date { Faker::Date.in_date_period }
  end
end
