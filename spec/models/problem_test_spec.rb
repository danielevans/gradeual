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

require 'spec_helper'

describe ProblemTest do
  
end
