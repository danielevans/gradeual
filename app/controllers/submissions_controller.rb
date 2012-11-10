require 'tmpdir'
class SubmissionsController < InheritedResources::Base
  before_filter :authenticate_student!

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
  
  protected
  def resource
    @submission = end_of_association_chain.where(:student_id=>:current_student_id).first_or_create!(:assignment_id => params[:assignment_id])
  end

end
