class AssignmentsController < InheritedResources::Base
  before_filter :authenticate_teacher!
  before_filter :fix_time_params, :only => [:create, :update]

  def create
    @assignment = Assignment.new(params[:assignment])
    @assignment.value = @assignment.problem.default_value if @assignment.value.blank?
    @assignment.teacher = current_teacher
    create!
  end

  protected

  def beginning_of_association_chain
    current_teacher
  end

  def fix_time_params
    [:start_at, :due_at].each do |param|
      date = Date.parse(params.delete(param))
      params[:assignment].merge!({
                      "#{param}(1i)" => date.year.to_s,
                      "#{param}(2i)" => date.month.to_s,
                      "#{param}(3i)" => date.day.to_s
                    })
    end
  end

end
