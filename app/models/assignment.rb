class Assignment < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :group
  belongs_to :problem_set
  has_one :problem
  attr_accessible :due_at, :start_at, :value, :problem_id, :group_id, :problem_set_id
end
