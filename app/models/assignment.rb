class Assignment < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :group
  belongs_to :problem_set
  belongs_to :problem
  attr_accessible :due_at, :start_at, :value, :problem_id, :group_id, :problem_set_id

  #validates_numericality_of :value, :greater_than_or_equal => 0
  
  def past_due?
    Time.new >= due_at
  end
  
  def started?
    Time.new >= start_at
  end
  
  def to_s
    problem.name
  end
end
