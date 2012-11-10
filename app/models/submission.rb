class Submission < ActiveRecord::Base
  attr_accessible :assignment, :assignment_id, :code
  attr_accessor :code
  belongs_to :student
  belongs_to :assignment

  after_save :store_code

  def code
    @code ||= get_code_from_store
  end

  def code_changed?
    @code != get_code_from_store
  end

  private
  def get_code_from_store
    if git_file_store.present?
      git_file_store.retrieve(assignment, App.language_extensions[assignment.problem.language])
    else
      nil
    end
  end

  def git_file_store
    unless [student, assignment].any? &:blank?
      @git_file_store ||= GitFileStore.new(student, assignment.group)
    end
  end

  def store_code
    puts "*"*80
    puts self.inspect
    if @code.present? && code_changed? && git_file_store
      git_file_store.store(assignment, App.language_extensions[assignment.problem.language], @code)
    end
  end
end
