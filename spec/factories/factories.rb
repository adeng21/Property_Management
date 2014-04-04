FactoryGirl.define do
  factory :owner do
    first_name 'John'
    last_name 'John'
    sequence(:email) {|n| "email#{n}@email.com"}

  end
end
