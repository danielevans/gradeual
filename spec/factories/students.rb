# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    sequence(:email) { |n| "student-#{n}@gradeual.dev" }
    password "simpleton"
    password_confirmation "simpleton"
  end
end
