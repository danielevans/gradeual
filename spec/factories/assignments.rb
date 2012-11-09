# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    teacher nil
    group nil
    problem_set nil
    problem nil
    start_at "2012-11-09 15:26:31"
    due_at "2012-11-09 15:26:31"
    value ""
  end
end
