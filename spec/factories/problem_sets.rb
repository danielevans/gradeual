# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :problem_set do
    group nil
    start_at "2012-11-09 14:53:54"
    name "MyString"
    description "MyText"
  end
end
