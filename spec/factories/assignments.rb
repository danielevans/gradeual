# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    teacher
    group
    problem_set
    problem
    start_at "2012-11-09 15:26:31"
    due_at "2012-11-09 15:26:31"
    value 1
  end
end
