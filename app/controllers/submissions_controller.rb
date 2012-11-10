class SubmissionsController < InheritedResources::Base
  before_filter :authenticate_student!

  protected

  def begin_of_association_chain
    current_student
  end
  
  protected
  def resource
    @submission = end_of_association_chain.first_or_create!(:assignment_id => params[:assignment_id])
  end

end
