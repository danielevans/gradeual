# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :problem_test do
    problem_id ""
    driver "MyText"
    expected_result "MyText"
  end
end
