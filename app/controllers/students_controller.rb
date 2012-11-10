class StudentsController < InheritedResources::Base
  actions :index, :show
  before_filter :authenticate_student_or_teacher!
  
  def index
    redirect_to root_url unless teacher_signed_in?
    index!
  end
  
  protected
  
  def resource
    @student = end_of_association_chain.find(teacher_signed_in? ? params[:id] : current_student.id)
  end
  
  def authenticate_student_or_teacher!
    redirect_to root_url, :alert => "You must sign in to continue" unless student_signed_in? || teacher_signed_in?
  end
  
end
