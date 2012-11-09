class ProblemTest < ActiveRecord::Base
  attr_accessible :driver, :expected_result, :problem_id, :show_result
  belongs_to :problem
end
