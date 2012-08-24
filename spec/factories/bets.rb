FactoryGirl.define do
  factory :bet do
    title       'Jump form 100m bridge'
    description 'Ill do something crazy'
    amount      500
    association :author, :factory => :random
  end
end
