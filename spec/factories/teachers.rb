# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teacher do
    sequence(:email) { |n| "teacher-#{n}@gradeual.dev" }
    password "simpleton"
    password_confirmation "simpleton"
  end
end
