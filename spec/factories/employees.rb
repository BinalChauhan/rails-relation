FactoryBot.define do
  factory :employee do
      firstname {  Faker::Name.first_name }
      lastname {  Faker::Name.last_name  }
      position { Faker::Internet.name  }
      company_id { 2 }
  end
end
