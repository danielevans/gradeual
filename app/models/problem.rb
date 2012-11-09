class Problem < ActiveRecord::Base
  attr_accessible :max_cpu_seconds, :max_megabytes, :max_total_seconds, :name, :reference_code, :template_code, :user_id
  has_many :problem_test
end
