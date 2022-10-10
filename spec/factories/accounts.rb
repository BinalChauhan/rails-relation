require 'faker'

FactoryBot.define do
  factory :account do
      firstname {  Faker::Name.first_name }
      lastname {  Faker::Name.last_name  }
      email { Faker::Internet.email  }
      password {  Faker::Internet.password  }
  end
end
