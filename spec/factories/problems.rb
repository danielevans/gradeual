# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :problem do
    name "MyString"
    user_id ""
    template_code "MyText"
    reference_code "MyText"
    max_cpu_seconds "9.99"
    max_total_seconds "9.99"
    max_megabytes "9.99"
  end
end
