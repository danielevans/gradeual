class AssignmentsController < InheritedResources::Base
  before_filter :authenticate_teacher!

  def beginning_of_association_chain
    current_teacher
  end
  
  def create
    @assignment = Assignment.new(params[:assignment])
    @assignment.value = @assignment.problem.default_value if @assignment.value.blank?
    @assignment.teacher = current_teacher
    create!
  end

end
