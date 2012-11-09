
class GitFileStore
  def self.repo_path(student, group)
    File.join App.repo_root_path, 'students', student.id.to_s, 'groups', group.id.to_s
  end

  def initialize(student, group)
    raise ArgumentError, 'Argument cannot be blank' if student.blank? || group.blank?

    @student = student
    @group = group

    initialize_repo
  end

  def repo_path
    self.class.repo_path(@student, @group)
  end

  def file_relative_path(problem, extension)
    file_relative_path = File.join("#{problem.id} #{problem.name}".parameterize, "#{problem.name.parameterize}#{extension}")
  end

  def file_path(problem, extension)
    File.join(repo_path, file_relative_path(problem, extension))
  end

  def store(problem, extension, data)
    problem = Problem.find(problem) unless problem.is_a? Problem

    path = file_path(problem, extension)
    FileUtils.mkdir_p File.dirname(path)
    File.open path, "w" do |file|
      file.write(data)
    end
    @git.add file_relative_path(problem, extension)
    @git.commit "Updating solution to #{problem.name}"
  end

  def retrieve(problem, extension)
    problem = Problem.find(problem) unless problem.is_a? Problem
    File.open(file_path(problem, extension)).read
  end

  protected

  def initialize_repo
    FileUtils.mkdir_p(repo_path)
    begin
      @git = Git.open repo_path
    rescue ArgumentError => e
      @git = Git.init repo_path
      @git.commit "Initial Commit", :allow_empty => true
    end
  end

end
