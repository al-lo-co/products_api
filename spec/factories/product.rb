# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    description { Faker::Quotes::Chiquito.joke }
    price { Faker::Number.number(digits: 5) }
  end
end
