class ProblemSet < ActiveRecord::Base
  belongs_to :group
  attr_accessible :description, :name, :start_at
end
