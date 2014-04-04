FactoryGirl.define do
  factory :owner do
    first_name 'John'
    last_name 'John'
    sequence(:email) {|n| "email#{n}@email.com"}

  end

  factory :building do
    street_address '101 launch st'
    city 'boston'
    state 'Massachusetts'
    postal_code '02222'
  end

end
