# == Schema Information
#
# Table name: problem_tests
#
#  id              :integer          not null, primary key
#  problem_id      :integer
#  driver          :text
#  expected_result :text
#  show_result     :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ProblemTest < ActiveRecord::Base
  attr_accessible :driver, :expected_result, :problem_id
  belongs_to :problem
end
