class SubmissionsController < InheritedResources::Base
  before_filter :authenticate_student!

  protected

  def begin_of_association_chain
    current_student
  end
end
