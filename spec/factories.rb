FactoryGirl.define do 

  factory :tour do
    name 'Summer Sanitarium'
  end

  factory :artist do
    name 'Metallica'
  end

  factory :venue do
    name 'Madison Square Garden'
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