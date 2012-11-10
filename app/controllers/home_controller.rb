class HomeController < ApplicationController
  def index
    if current_teacher
      teacher
    elsif current_student
      student
    end  
      
  end
  
  protected
  
  def teacher
    @groups = Group.all
    render :teacher
  end
  
  def student
    render :student
  end
end
