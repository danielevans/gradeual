class AssignmentsController < InheritedResources::Base
  before_filter :authenticate_teacher!

  def beginning_of_association_chain
    current_teacher
  end
end
