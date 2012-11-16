require 'tmpdir'
class SubmissionsController < InheritedResources::Base
  before_filter :authenticate_student!

  def new
    @submission = current_student.submissions.where(:assignment_id => params[:assignment_id]).first
    new!
  end

  def create
    create! do |format|
      format.html {
        redirect_to edit_resource_path(resource)
      }
    end
  end


  def update
    update! do |format|
      format.html {
        redirect_to edit_resource_path(resource)
      }
    end
  end

  def download_bundle
    path = GitFileStore.repo_path(current_student, resource.assignment.group)
    tar_name = "#{current_student.id}-#{resource.assignment.group.id}"
    Dir.mktmpdir do |dir|
      tarball = "#{dir}/#{tar_name}.tar"
      `cd #{path}; tar -cf #{tarball} .`
      send_file tarball, :type => "application/x-tar", :x_sendfile => true
    end
  end

  protected

  def begin_of_association_chain
    current_student
  end

  def build_resource
    super
    if params[:assignment_id].present?
      @submission.assignment_id = params[:assignment_id]
      @submission.code ||= @submission.assignment.problem.reference_code
    end
    @submission
  end

end
