FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end

  sequence :login do |n|
    "Random#{n}"
  end

  factory :remi, :class => User do
    login                 'Remi'
    password              'pass123'
    password_confirmation 'pass123'
    email                 'remi@example.com'
  end

  factory :random, :class => User do
    login
    email
    password              'pass123'
    password_confirmation 'pass123'
  end
end
