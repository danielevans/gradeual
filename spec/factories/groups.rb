# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    teacher
    name "MyString"
    description "MyString"
    tags "MyString"
  end
end
