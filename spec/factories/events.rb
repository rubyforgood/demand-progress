# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    trait :last_week do
      occurs_at { Time.current.last_week }
    end

    trait :this_week do
      occurs_at { Time.current }
    end

    trait :next_week do
      occurs_at { Time.current.next_week }
    end
  end
end
