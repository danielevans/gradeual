class StudentsController < InheritedResources::Base
  actions :index, :show
  protected

  def begin_of_association_chain
    
  end
  
  protected
  
  def index
    redirect_to student_path(current_student) unless current_teacher
    index!
  end
  
  def authenticate_student_or_teacher!
    redirect_to root_url, :alert => "You must sign in to continue" unless student_signed_in? || teacher_signed_in?
  end
  
end
