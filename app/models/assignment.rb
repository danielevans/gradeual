class Assignment < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :group
  belongs_to :problem_set
  belongs_to :problem
  after_initialize :init_dates
  attr_accessible :due_at, :start_at, :value, :problem_id, :group_id, :problem_set_id
  validate :start_at_before_due_at
  #validates_numericality_of :value, :greater_than_or_equal => 0

  def to_s
    problem.name
  end

  protected
  def init_dates
    self.start_at ||= DateTime.tomorrow.beginning_of_day
    self.due_at ||= DateTime.tomorrow.end_of_day
  end

  def start_at_before_due_at
    errors.add :start_at, :cant_be_after_due_at if start_at > due_at
  end
end
