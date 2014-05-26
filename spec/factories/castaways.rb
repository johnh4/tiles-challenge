# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :castaway do
		sequence(:name) { |n| "Person #{n}" }
		team
  end
end
