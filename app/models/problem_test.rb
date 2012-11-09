class ProblemTest < ActiveRecord::Base
  attr_accessible :driver, :expected_result, :problem_id
  belongs_to :problem
end
