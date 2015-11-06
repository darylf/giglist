FactoryGirl.define do
  factory :tour do
    sequence(:name) { |n| "European Tour #{n}}" }
  end

  factory :artist do
    sequence(:name) { |n| "Metal Band #{n}}" }
  end

  factory :venue do
    sequence(:name) { |n| "Awesome Arena #{n}}" }
  end

  factory :event do
    start_date '2000-01-01'
    venue
  end

  factory :lineup do
    artist
    event
  end
end
