class GroupsController < InheritedResources::Base
  before_filter :authenticate_teacher!

  def beginning_of_association_chain
    current_teacher
  end
  
  def create
    @group = Group.new(params[:group])
    @group.teacher = current_teacher
    create!
  end
end