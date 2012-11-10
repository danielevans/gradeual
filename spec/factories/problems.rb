# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :problem do
    sequence(:name) { |n| "MyString #{n}" }
    template_code "MyText"
    reference_code "MyText"
    max_cpu_seconds "9.99"
    max_total_seconds "9.99"
    max_megabytes "9.99"
    language "python27"
  end
end
