class Submission < ActiveRecord::Base
  attr_accessible :assignment, :assignment_id, :code
  attr_accessor :code
  belongs_to :student
  belongs_to :assignment

  after_save :store_code

  def code
    @code ||= retrieve_code
  end

  def code_changed?
    @code != @code_was
  end

  def to_s
    "#{assignment.to_s} - #{updated_at.to_s :short}"
  end

  private
  def retrieve_code
    if git_file_store.present?
      @code_was = git_file_store.retrieve(assignment, App.language_extensions[assignment.problem.language])
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
    if @code.present? && code_changed? && git_file_store
      git_file_store.store(assignment, App.language_extensions[assignment.problem.language], @code)
    end
  end
end
