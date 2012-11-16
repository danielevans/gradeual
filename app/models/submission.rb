require 'net/http'

class Submission < ActiveRecord::Base
  attr_accessible :assignment, :assignment_id, :code, :response
  attr_accessor :code
  belongs_to :student
  belongs_to :assignment

  before_save :submit_code
  after_save :store_code

  def success?
    return true if responde.nil?
    JSON.parse(response).each do |status|
      if status['Success'] == false
        return false
      end
    end
    true
  end

  def parse_json
    JSON.parse(response)
  end

  def code
    @code ||= retrieve_code
  end

  def code_changed?
    @code != retrieve_code
  end

  def submit_code
    if !@code.present?
      return
    end

    uri = URI("http://gradeual.com:8080/grade/python27/expression")
    #TODO
    #uri = URI("http://#{App.sandbox_server}/grade/python27/inputoutput")
    req = Net::HTTP::Post.new(uri.path)
    req.body = self.to_json
    Rails.logger.info req.body
    req["Content-Type"] = "application/json"
    req["Accept"] = "application/json"

    http = Net::HTTP.new(uri.host, uri.port)
    resp = http.start {|htt| htt.request(req)}
    self.response = resp.body
  end

  def to_json
    problem = assignment.problem
    tests = []
    problem.problem_tests.each do |t|
      tests << t.driver
    end

    {
       "MaxCPUSeconds" => problem.max_cpu_seconds,
       "MaxTotalSeconds" => problem.max_total_seconds,
       "MaxMB" => problem.max_megabytes,
       "Reference" => problem.reference_code,
       "Candidate" => code,
       "Tests" => tests
    }.to_json
  end

  def to_s
    "#{assignment.to_s} - #{updated_at.to_s :short}"
  end

  private
  def retrieve_code
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
    if @code.present? && code_changed? && git_file_store
      git_file_store.store(assignment, App.language_extensions[assignment.problem.language], @code)
    end
  end
end
